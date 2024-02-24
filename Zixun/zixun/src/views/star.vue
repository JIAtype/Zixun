<template>
	<div style="height: 20px; margin: 10px 0 10px 0; text-align: center">
		<el-input v-model="keyword" style="width: 800px; margin-right: 1px" placeholder="请输入要搜索的明星"
			@keyup.enter="search" />
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
	import qs from "qs";

	export default {
		name: "starlist",

		created() {
			console.log("created");
			this.getstarlist();
		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				route: useRoute(),
				starlist: {},
				imgUrl: config.imgUrl,
				keyword: '',
			};
		},

		methods: {
			getstarlist() {
				console.log("开始获取明星数据");
				axios
					.post(config.baseUrl + "star/list")
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

			search() {
				if (this.keyword == '') {
					this.$router.push('/star')
				} else {
					this.$router.push('/searchstar/' + this.keyword)
				}
			},

		},
	};
</script>

<style scoped>
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
