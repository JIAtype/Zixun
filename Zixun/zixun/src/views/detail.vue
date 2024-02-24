<template>
	<search></search>
	<div class="main-left">
		<div class="box-header">资讯详情</div>
		<div class="detail">
			<h2 style="text-align: center; font-size: 20px">{{ article.title }}</h2>

			<div style="
          text-align: center;
          margin-top: 15px;
          font-size: 12px;
          color: #888;
        ">
				来源：{{ article.author }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间：{{ article.postdate }}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击量：{{ article.hitcount }}次
			</div>
			<hr />

			<div class="rightullidiv">
				<img :src="imgUrl + article.img" alt="无图片" class="rightulliimg">
			</div>

			<div style="line-height: 27px; padding: 15px; font-size: 14px;min-height: 400px;">
				<pre style="width:660px;white-space: pre-wrap;word-break:break-all; ">{{ article.content }}</pre>
			</div>

			<div style="text-align: center; margin-top: 20px">
				<el-button type="primary" @click="dianzan">
					👍点赞({{ zancount }})
				</el-button>
				<el-button type="success" @click="shoucang">
					⭐️收藏({{ article.shoucangcount }})
				</el-button>
			</div>
		</div>

		<div style="margin-top: 60px;"></div>
		<span style="color: #ED811A;">评论栏</span><span
			style="font-size: 12px; color: #888;">&nbsp;&nbsp;&nbsp;目前已经{{ article.pingluncount }}条</span>
		<div style="margin-top: 10px; border-top: solid #ED811A 2px; padding-top: 10px">


			<div v-for="item of feedbacklist" :key="item" style="
          font-size: 14px;
          margin-bottom: 4px;
          min-height: 50px;
          border: solid 1px #ccc;
          padding: 10px;
        ">
				<div style="margin-bottom: 10px">
					<span style="font-size: 12px">{{item.username}}({{item.adddate}})</span>
					<a v-if="user != null && user.isAdmin == true" style="margin-left:10px;font-size:12px; float:right;"
						href="javascript:void(0);" @click="deletePinglun(item.id)">删除</a>
				</div>
				{{item.message}}
			</div>

			<div style="margin-top: 30px">
				<el-form ref="formRef" :model="form">
					<el-form-item label="评论内容">
						<el-input v-model="form.message" type="textarea"></el-input>
					</el-form-item>
					<el-form-item style="float: right">
						<el-button type="primary" @click="onSubmit">提交</el-button>
					</el-form-item>
				</el-form>
			</div>
		</div>
	</div>
	<Sidebar></Sidebar>
</template>

<script>
	import {
		useRoute
	} from "vue-router";
	import {
		Search,
		Edit,
		Check,
		Message,
		Star,
		Delete,
	} from "@element-plus/icons-vue";
	import Sidebar from "@/components/sidebar.vue";

	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";
	import search from "@/components/search.vue";

	export default {
		name: "list",

		components: {
			Search,
			Edit,
			Check,
			Message,
			Star,
			Delete,
			Sidebar,
			search,
		},

		created() {
			this.articleId = this.route.params.id;
			console.log('articel id:' + this.articleId)
			this.user = JSON.parse(localStorage.getItem("user"));
			if (this.user != null) {
				this.form.username = this.user.username;
			}
			this.form.articleid = this.articleId;
			this.getdetail();
			this.getFeedbackList();
		},

		data() {
			return {
				imgUrl: config.imgUrl,
				articleId: 0,
				route: useRoute(),
				user: JSON.parse(localStorage.getItem("user")),
				article: {},
				form: {
					message: "",
					articleid: 0,
					username: "",
				},
				zancount: 0,
				shoucangcount: 0,
				feedbacklist: {},
			};
		},

		methods: {
			getId() {
				console.log(this.$route.query);
			},

			/**
			 * 获取内容详情
			 */
			getdetail() {
				axios
					.get(config.baseUrl + "article/detail?articleid=" + this.articleId)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							this.article = result.data;
							this.image = result.data
							this.zancount = result.data.zancount;
							this.pingluncount = result.data.pingluncount;
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			dianzan() {
				this.user = JSON.parse(localStorage.getItem("user"));
				console.log(this.user);
				if (this.user == null) {
					ElMessage.error("请先登录！");
					return;
				}
				axios
					.get(config.baseUrl + "article/dianzan?articleid=" + this.articleId + "&userid=" + this.user.id)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							this.article = result.data;
							this.zancount = result.data.zancount;
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			shoucang() {
				this.user = JSON.parse(localStorage.getItem("user"));
				console.log(this.user);
				if (this.user == null) {
					ElMessage.error("请先登录！");
					return;
				}
				axios
					.get(
						config.baseUrl +
						"article/shoucang?articleid=" +
						this.articleId +
						"&userid=" +
						this.user.id
					)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							this.article = result.data;
							console.log(result.data.shoucangcount);
							ElMessage.success(result.msg);
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			/**
			 * 提交回复
			 */
			onSubmit() {
				this.user = JSON.parse(localStorage.getItem("user"));
				console.log(this.user);
				if (this.user == null) {
					ElMessage.error("请先登录！");
					return;
				}
				axios
					.post(config.baseUrl + "feedback/add?userid=" + this.user.id, this.form)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.getFeedbackList();
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			getFeedbackList() {
				axios
					.get(config.baseUrl + "feedback/list?articleId=" + this.articleId)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							//ElMessage.success(result.msg); 
							this.feedbacklist = result.data
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			deletePinglun(pinglunId) {
				axios
					.get(config.baseUrl + "feedback/delete?pinglunId=" + pinglunId)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.getFeedbackList();
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},
		},
	};
</script>

<style>
	.rightullidiv {
		background: transparent display=flex;
		justify-content: center;
		align-items: center;
	}

	.rightulliimg {
		float: left;
		max-width: 400px;
		max-height: 400px;
		border: 10px solid transparent
	}
</style>
