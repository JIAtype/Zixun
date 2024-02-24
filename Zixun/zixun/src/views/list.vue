<template>
	<search></search>
	<div class="main-left">
		<div class="box-header">{{catdata.name}}列表</div>
		<div v-for="item of article" :key="item" class="newslist">
			<div class="title">
				<!-- <a style="color: #333" href="'/detail/' + item.id ">【{{ item.catname }}】{{ item.title }}</a> -->
				<router-link style="color: #333" :to="{ path: '/detail/' + item.id }">
					【{{ item.catname }}】{{ item.title }}
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
	<Sidebar></Sidebar>
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
			this.categoryId = this.route.params.id;
			this.getarticle();
			this.getCategoryName();
		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				categoryId: 0,
				route: useRoute(),
				article: {},
				catdata: '',
				imgUrl: config.imgUrl,
			};
		},

		watch: {
			/**
			 * 监测路由参数的变化
			 */
			$route() {
				this.categoryId = this.route.params.id;
				this.getarticle();
				this.getCategoryName();
				console.log("重新请求" + this.categoryId + "的数据");
			},
		},

		methods: {
			getId() {
				console.log(this.$route.query);
			},
			getarticle() {
				axios
					.post(config.baseUrl + "article/category?catid=" + this.categoryId)
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

			getCategoryName() {
				axios
					.get(config.baseUrl + "article/getcategoryname?catid=" + this.categoryId)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							//ElMessage.success(result.msg); 
							this.catdata = result.data
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
