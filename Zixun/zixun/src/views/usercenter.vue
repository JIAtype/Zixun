<template>
	<div class="menu">
		<div class="title">用户中心</div>
		<ul class="list">
			<li>
				<router-link style="color:#333;display:block;" :to="{ path: '/usercenter' }">我的收藏</router-link>
			</li>
			<li>
				<router-link style="color:#333;display:block;" :to="{ path: '/usercenter/modify' }">资料修改</router-link>
			</li>
		</ul>
	</div>

	<div class="content">
		<div class="title">我的收藏</div>
		<ul class="articlelist" v-for="item of shoucanglist" :key="item">
			<li>
				<router-link :to="{ path: '/detail/'+item.articleId }">{{item.title}}</router-link>
				<a href="javascript:void(0);" @click="deleteShoucang(item.shoucangId)">【删除】</a>
			</li>
		</ul>
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

	export default {
		name: "usercenter",

		components: {
			Sidebar,
		},

		created() {
			this.user = JSON.parse(localStorage.getItem("user"));
			this.getmyshoucang();
		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				shoucanglist: {},
				form: {
					message: "",
					articleid: 0,
					username: "",
				},
			};
		},

		methods: {
			getmyshoucang() {
				axios
					.get(config.baseUrl + "shoucang/getmyshoucang?userid=" + this.user.id)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							console.log(result.data);
							this.shoucanglist = result.data;
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			deleteShoucang(shoucangid) {
				axios
					.get(config.baseUrl + "shoucang/delete?shoucangId=" + shoucangid)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							this.getmyshoucang();
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

<style scoped>
	@import "@/assets/usercenter.css";
</style>
