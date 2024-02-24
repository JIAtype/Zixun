<template>
	<search></search>
	<div class="main-left">
		<div class="box-header">搜索结果</div>
		<!-- <el-empty v-if="article == null" description="description" />                              -->
		<div v-for="item of article" :key="item" class="newslist">
			<div class="title">
				<!-- <a :href="'/detail/' + item.id ">【{{ item.catname }}】{{ item.title }}</a> -->
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
	import search from "@/components/search.vue";
	import qs from "qs";

	export default {
		name: "home",

		components: {
			Sidebar,
			search,
		},

		data() {
			return {
				article: {},
				imgUrl: config.imgUrl,
				route: useRoute(),
				keyword: "",
			};
		},

		created() {
			console.log("进入搜索页面");
			this.keyword = this.route.params.keyword;
			this.search();
		},

		// watch: {
		// 	/**
		// 	 * 监测路由参数的变化
		// 	 */
		// 	$route() {
		// 		this.keyword = this.route.params.keyword;
		// 		console.log("搜索" + this.keyword + "的数据");
		// 		this.search();
		// 	},
		// },

		methods: {
			search() {
				axios
					.get(config.baseUrl + "article/search?title=" + this.keyword)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							console.log(result.data);
							this.article = result.data;
						} else {
							ElMessage.error(result.msg);
							this.article == null;
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},
		},
	};
</script>
