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
		<div class="title">资料修改</div>
		<el-form :model="form" :rules="rules" ref="ruleForm">
			<el-form-item label="用户名" label-width="90px" prop="username">
				<el-input v-model="form.username" autocomplete="off"></el-input>
			</el-form-item>
			<el-form-item label="密码" label-width="90px" prop="pwd">
				<el-input type="password" v-model="form.pwd" autocomplete="off"></el-input>
			</el-form-item>
			<el-form-item label="性别" label-width="90px" prop="sex">
				<el-select v-model="form.sex" placeholder="请选性别">
					<el-option label="男" value="男"></el-option>
					<el-option label="女" value="女"></el-option>
				</el-select>
			</el-form-item>
			<el-form-item label="年龄" label-width="90px" prop="age">
				<el-input v-model="form.age" autocomplete="off"></el-input>
			</el-form-item>
			<el-form-item label="联系电话" label-width="90px" prop="tel">
				<el-input v-model="form.tel" autocomplete="off"></el-input>
			</el-form-item>
			<el-form-item label="个人简介" label-width="90px" prop="jianjie">
				<el-input v-model="form.jianjie" autocomplete="off"></el-input>
			</el-form-item>
		</el-form>
		<div style="text-align:center;">
			<el-button type="primary" @click="modifyHandleSave">确 定</el-button>
		</div>
	</div>

</template>

<script>
	import {
		useRoute
	} from "vue-router";

	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";

	export default {
		name: "modify",

		created() {
			this.user = JSON.parse(localStorage.getItem("user"));
			this.form = this.user;
		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				form: {
					username: "",
					pwd: "",
					sex: "",
					age: "",
					tel: "",
					id: 0,
				},
			};
		},

		methods: {
			modifyHandleSave() {
				axios
					.post(config.baseUrl + "user/modify", this.form)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			}
		},
	};
</script>

<style scoped>
	@import "@/assets/usercenter.css";
</style>