<template>
	<div style="height: 20px; margin: 10px 0 10px 0; text-align: center">
		<el-input v-model="keyword" style="width: 800px; margin-right: 1px" placeholder="请输入要搜索的明星" />
		<el-button type="primary" plain @click="search">搜索🔍</el-button>
	</div>
	<div class="star">
		<div class="box-header">明星专题</div>
		<div class="demo-fit">
			<ul>
				<li v-for="item in starlist" :key="item">
					<a href="javascript:void(0);" @click="clickStar(item.id)">
						<el-avatar shape="square" :size="200" fit="cover" :src="imgUrl + item.img"></el-avatar>
						<br>
						<span class="title">{{ item.name }}</span>
					</a>
				</li>
			</ul>
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
				starlist: {},
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
				if (this.keyword == '') {
					this.$router.push("/star");
					return;
				}
				axios
					.get(config.baseUrl + "star/search?starname=" + this.keyword)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							console.log(result.data);
							this.starlist = result.data;
						} else {
							ElMessage.error(result.msg);
							this.starlist == null;
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},
			clickStar(starid) {
				this.$router.push("/starnews/" + starid);
			},
		},
	};
</script>

<style>
	.demo-fit {
		display: flex;
		text-align: center;
		justify-content: space-between;
	}

	.demo-fit .block {
		flex: 1;
		display: flex;
		flex-direction: column;
		flex-grow: 0;
	}

	.demo-fit .title {
		margin-top: 10px;
		font-size: 14px;
		color: var(--el-text-color-secondary);
	}

	.star {
		border: solid 1px #ccc;
		min-height: 700px;
		border-radius: 5px;
		background-color: #eeeeee;
		margin: 20px 0 0 0;
		padding: 20px;
	}

	.demo-fit ul li {
		float: left;
		margin: 10px;
	}

	.box-header {
		height: 30px;
		line-height: 30px;
		border-bottom: solid 2px #ED811A;
		color: #ED811A;
		margin-bottom: 20px;
		text-align: center;
	}
</style>
