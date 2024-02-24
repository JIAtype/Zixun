<template>
	<div style="height: 20px; margin: 10px 0 10px 0; text-align: center">
		<el-input v-model="keyword" style="width: 800px; margin-right: 1px" placeholder="请输入要搜索的明星"
			@keyup.enter="search" />
		<el-button type="primary" plain @click="search">搜索🔍</el-button>
	</div>
	<div class="main-left" style="width: 460px; min-height: 900px;">
		<div class="box-header">{{stardata.name}}简介</div>
		<div class="content">
			<div class="desc" style="line-height:26px; font-size:14px;">
				<img :src="imgUrl + stardata.img" alt="无图片"
					style="  max-width: 200px; float:left; border:10px solid transparent ">
				<h1 style="font-size:20px">{{stardata.name}}<br /></h1>
				<pre style="width:460px;white-space: pre-wrap;word-break:break-all; ">{{stardata.desc}} </pre>
			</div>
		</div>
	</div>
	<div class="main-right" style="width: 490px; min-height: 900px;">
		<div class="box-header">{{stardata.name}}相关资讯</div>
		<div v-for="item of article" :key="item" class="newslist">
			<div class="title">
				<router-link style="color: #333" :to="{ path: '/detail/' + item.id }">
					【{{ stardata.name }}】{{ item.title }}
				</router-link>
			</div>
			<div class="content">
				<div class="img">
					<img :src="imgUrl + item.img" alt="" />
				</div>
				<div class="desc">
					{{ item.content.slice(0,100) }}
				</div>
			</div>
			<div style="clear: both"></div>
			<div class="date">
				日期：{{ item.postdate.replace(/T/g, ' ') }} &nbsp;&nbsp;&nbsp;&nbsp;
				📌收藏：{{ item.shoucangcount}} &nbsp;&nbsp;&nbsp;&nbsp;
				💬评论：{{ item.pingluncount }}&nbsp;&nbsp;&nbsp;&nbsp;
				🔥阅读量：{{ item.hitcount }}
			</div>
		</div>
	</div>
</template>

<script>
	import {
		useRoute
	} from "vue-router";
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
			Sidebar,
			search,
		},

		created() {
			this.starid = this.route.params.starid;
			this.getarticle();
			this.getStarData();
		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				starid: 0,
				route: useRoute(),
				article: {},
				stardata: '',
				imgUrl: config.imgUrl,
			};
		},

		watch: {
			/**
			 * 监测路由参数的变化
			 */
			$route() {
				this.starid = this.route.params.starid;
				this.getarticle();
				this.getStarData();
				console.log("重新请求明星" + this.starid + "的数据");
			},
		},

		methods: {
			getId() {
				console.log(this.$route.query);
			},
			getarticle() {
				axios
					.post(config.baseUrl + "article/getstarnews?starid=" + this.starid)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							this.article = result.data;
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			getStarData() {
				axios
					.get(config.baseUrl + "star/getstardata?starid=" + this.starid)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							//ElMessage.success(result.msg); 
							this.stardata = result.data
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},
			search() {
				if (this.keyword == '') {
					this.$router.push('/star')
				} else {
					this.$router.push('/searchstar/' + this.keyword)
				}
			},
			clickStar(starid) {
				this.$router.push("/starnews/" + starid);
			},
		},
	};
</script>

<style>
	.newslist {
		border-bottom: solid 1px #ccc;
		padding: 10px;
		overflow: auto;
	}

	.newslist .title {
		font-size: 16px;
		padding: 5px 0 5px 0;
	}

	.newslist .title a:hover {
		color: #eb6400;
		text-decoration: underline;
	}

	.newslist .content {
		font-size: 14px;
		padding: 15px 0 5px 0;
	}

	.newslist .content img {
		width: 120px;
		height: 75px;
		float: left;

	}

	.newslist .content .desc {
		width: 350px;
		float: right;
		line-height: 24px;
		color: #888;
	}

	.newslist .date {
		margin-top: 20px;
		font-size: 14px;
		color: #888;
	}
</style>