<template>
	<div class="main-right">
		<div class="box-header">🔥 🔥 🔥 热点推荐 💫</div>
		<div v-for="(item, index) of top5hitcount" :key="item" class="newslist">
			<div class="title">{{index+1}}、<a :href="'/detail/' + item.id ">{{item.title}}</a></div>
		</div>
	</div>

	<div class="main-right">
		<div class="box-header">💬 快来看看大家都在说什么！👇</div>
		<div v-for="(item, index) of top5pinglun" :key="item" class="newslist">
			<div class="title">{{index+1}}、<a :href="'/detail/' + item.id ">{{item.title}}</a></div>
		</div>
	</div>

	<div class="main-right">
		<div class="box-header">🌕 大家都在关注👇</div>
		<div v-for="(item, index) of top5shoucang" :key="item" class="newslist">
			<div class="title">{{index+1}}、<a :href="'/detail/' + item.id ">{{item.title}}</a></div>
		</div>
	</div>
</template>

<script>
	import {
		RouterLink,
		RouterView
	} from "vue-router";

	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";

	export default {
		name: "sidebar",

		created() {
			this.gettop5shoucang();
			this.gettop5pinglun();
			this.gettop5hitcount();
		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				top5shoucang: {},
				top5pinglun: {},
				top5hitcount: {},

			};
		},

		methods: {
			gettop5shoucang() {
				axios
					.get(config.baseUrl + "article/gettop5shoucang")
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							//ElMessage.success(result.msg); 
							this.top5shoucang = result.data
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			gettop5pinglun() {
				axios
					.get(config.baseUrl + "article/gettop5pinglun")
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							//ElMessage.success(result.msg); 
							this.top5pinglun = result.data
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			gettop5hitcount() {
				axios
					.get(config.baseUrl + "article/gettop5hitcount")
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							//ElMessage.success(result.msg); 
							this.top5hitcount = result.data
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
