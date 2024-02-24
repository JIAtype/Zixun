<template>
	<div style="height: 20px; margin: 10px 0 10px 0; text-align: center">
		<el-input v-model="keyword" style="width: 800px; margin-right: 1px" placeholder="请输入明星资讯相关关键字"
			@keyup.enter="globalSearch" />
		<el-button type="primary" plain @click="globalSearch">搜索🔍</el-button>
	</div>
</template>

<script>
	import {
		useRoute,
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
		name: "searchcomponent",

		created() {},

		data() {
			return {
				keyword: "",
			};
		},

		methods: {
			globalSearch() {
				if (this.keyword == '') {
					this.$router.push('/')
				} else {
					this.$router.push('/search/' + this.keyword)
				}
			},
		},
	};
</script>
