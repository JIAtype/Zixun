<template>
	<div class="demo-fit">
		<ul>
			<li v-for="item in starlist" :key="item">
				<el-tooltip class="box-item" effect="dark" placement="bottom">
					<template #content>{{ item.name }}<br />{{ item.desc.slice(0,15) }}......<br />点击查看详情 </template>
					<a href="javascript:void(0);" @click="clickStar(item.id)">
						<el-avatar class="xm" :size="100" fit="cover" :src="imgUrl + item.img">
						</el-avatar>
					</a>
				</el-tooltip>
			</li>
		</ul>
	</div>
	<search></search>
	<div class="main-left">
		<div class="box-header">最新资讯</div>

		<div v-for="item of article" :key="item" class="newslist">
			<div class="title">
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
	import Sidebar from "@/components/sidebar.vue";
	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";
	import search from "@/components/search.vue";
	export default {
		name: "home",

		components: {
			Sidebar,
			search,
		},

		created() {
			axios
				.post(config.baseUrl + "article/getall")
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
			this.getstarlist();
		},

		data() {
			return {
				article: {},
				starlist: {},
				imgUrl: config.imgUrl,
			};
		},

		methods: {
			getstarlist() {
				console.log("开始获取明星数据");
				axios
					.post(config.baseUrl + "star/toplist")
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							this.starlist = result.data;
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			clickStar(starid) {
				this.$router.push("/starnews/" + starid);
			},
		}
	};
</script>
