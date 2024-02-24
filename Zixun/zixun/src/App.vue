<template>
	<div class="wrapper">
		<ul class="nav">
			<li>
				<img src="@/assets/images/logo.png" style="height: 60px" alt="" />
			</li>
			<li>
				<router-link :to="{ path: '/' }" :key="$route.fullPath">首页</router-link>
			</li>
			<li>
				<router-link :to="{ path: '/list/1' }" :key="$route.fullPath">明星资讯</router-link>
			</li>
			<li>
				<router-link :to="{ path: '/list/2' }" :key="$route.fullPath">电影资讯</router-link>
			</li>
			<li>
				<router-link :to="{ path: '/list/3' }">电视资讯</router-link>
			</li>
			<li>
				<router-link :to="{ path: '/list/4' }">音乐资讯</router-link>
			</li>
			<li>
				<router-link :to="{ path: '/list/5' }">体育资讯</router-link>
			</li>
			<li>
				<router-link :to="{ path: '/star' }">明星专题</router-link>
			</li>
			<li v-if="user == null" style="float: right; margin-right: 10px">
				<el-button color="transparent" type="text" @click="dialogVisible = true">登录</el-button>
			</li>
			<li v-if="user == null" style="float: right; margin-right: 10px">
				<el-button color="transparent" type="text" @click="regDialogVisible = true">注册</el-button>
			</li>

			<li v-if="user != null" style="float: right; margin-right: 10px">
				<el-button color="transparent" type="text" @click="logout">退出</el-button>
			</li>

			<li v-if="user != null" style="float: right; margin-right: 10px">
				<router-link style="font-size: 14px" :to="{ path: '/usercenter' }" tag="button">用户中心</router-link>
			</li>
			<li v-if="user != null && user.isAdmin == true" style="float: right; margin-right: 10px">
				<router-link style="font-size: 14px" :to="{ path: '/admin/index' }" tag="button">后台管理</router-link>
			</li>
			<li v-if="user != null" style="float: right; margin-right: 10px ;color:white">
				<span style="font-size: 14px" color="red">欢迎 {{ user.username }} ！</span>
			</li>
		</ul>

		<div style="clear: both"></div>

		<div>
			<!-- 			//第一种轮播图
			<el-carousel :interval="5000" arrow="always">
				<el-carousel-item v-for="item in images" :key="item.id">
					<router-link style="color: #333" :to="{ path: '/detail/' + item.id }">
						<img :src="imgUrl + item.url" alt="" @click="lunbotuClick(item.id)" />
					</router-link>
				</el-carousel-item>
			</el-carousel> -->
			<el-carousel :interval="4000" type="card" height="300px">
				<el-carousel-item v-for="item in images" :key="item.id">
					<a :href="'/detail/' + item.id " style="color: #333">
						<img :src="imgUrl + item.url" @click="lunbotuClick(item.id)" style="max-width: 100%;" />
						<div class="zhezhao">
							<p>{{ item.title }}</p>
						</div>
					</a>
				</el-carousel-item>
			</el-carousel>
		</div>

		<div class="main">
			<RouterView />
		</div>

	</div>

	<div style="clear: both"></div>

	<el-dialog v-model="dialogVisible" title="用户登录" width="400px" :before-close="handleClose">
		<el-form :model="form" :rules="rules" ref="ruleForm">
			<el-form-item label="用户名" label-width="90px" prop="username">
				<el-input v-model="form.username" autocomplete="off"></el-input>
			</el-form-item>
			<el-form-item label="密码" label-width="90px" prop="pwd">
				<el-input type="password" v-model="form.pwd" autocomplete="off"></el-input>
			</el-form-item>
		</el-form>
		<div class="dialog-footer" style="text-align: center; margin-top: 40px">
			<el-button @click="handleClose">取 消</el-button>
			<el-button type="primary" @click="handleSave">确 定</el-button>
		</div>
	</el-dialog>

	<el-dialog v-model="regDialogVisible" title="新用户注册" width="400px" :before-close="regHandleClose">
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
				<el-input-number v-model="form.age" autocomplete="off" :min="0"></el-input-number>
			</el-form-item>
			<el-form-item label="联系电话" label-width="90px" prop="tel">
				<el-input v-model="form.tel" autocomplete="off"></el-input>
			</el-form-item>
		</el-form>
		<div class="dialog-footer" style="text-align: center; margin-top: 40px">
			<el-button @click="regHandleClose">取 消</el-button>
			<el-button type="primary" @click="regHandleSave">确 定</el-button>
		</div>
	</el-dialog>

	<div class="footer">
		<div class="wrapper">
			&copy;2022 陈佳 · 毕业设计 · 前端技术：Vue.js · 后端技术：ASP.NET core
			·数据库：MySQL
		</div>
	</div>
</template>

<style>
	@import "@/assets/style.css";
</style>

<script>
	import {
		RouterLink,
		RouterView
	} from "vue-router";
	import Sidebar from "@/components/sidebar.vue";
	import search from "@/components/search.vue";

	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";
	axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'

	export default {
		name: "app",

		components: {
			Sidebar,
			search,
		},

		created() {
			this.getLunbotuList();
		},

		data() {
			return {
				images: [],
				imgUrl: config.imgUrl,
				article: {},
				user: JSON.parse(localStorage.getItem("user")),
				dialogVisible: false,
				regDialogVisible: false,
				form: {
					username: "",
					pwd: "",
					sex: "",
					age: "",
					tel: "",
				},

				rules: {
					username: [{
						required: true,
						message: "请输入用户名",
						trigger: "blur"
					}, ],
					pwd: [{
						required: true,
						message: "请输入密码",
						trigger: "blur"
					}],
				},
			};
		},

		methods: {
			/**
			 * 用户登录窗口关闭
			 */
			handleClose() {
				this.$refs.ruleForm.resetFields();
				this.form = {
					username: "",
					pwd: "",
					sex: "",
					age: "",
					tel: "",
				};
				this.dialogVisible = false;
			},

			/**
			 * 用户登录
			 */
			handleSave() {
				this.$refs.ruleForm.validate((valid) => {
					if (valid) {
						console.log("输入正确,保存数据并关闭登录窗口");
						axios
							.get(
								config.baseUrl +
								"user/login?username=" +
								this.form.username +
								"&pwd=" +
								this.form.pwd
							)
							.then((response) => {
								// JSON responses are automatically parsed.
								console.log(response.data);
								var result = response.data;
								if (result.code == 0) {
									this.user = result.data;
									localStorage.setItem("user", JSON.stringify(result.data));
									//this.user = JSON.parse(localStorage.getItem("user"));
									this.dialogVisible = false;
								} else {
									ElMessage.error(result.msg);
								}
							})
							.catch((e) => {
								this.errors.push(e);
							});
					} else {
						console.log("输入错误");
					}
				});
			},

			/**
			 * 退出登录
			 */
			logout() {
				localStorage.clear();
				this.user = null;
			},

			/**
			 * 注册窗口关闭
			 */
			regHandleClose() {
				this.$refs.ruleForm.resetFields();
				this.form = {
					username: "",
					pwd: "",
					sex: "",
					age: "",
					tel: "",
				};
				console.log("关闭注册窗口");
				this.regDialogVisible = false;
			},

			/**
			 * 用户注册
			 */
			regHandleSave() {
				this.$refs.ruleForm.validate((valid) => {
					if (valid) {
						console.log("输入正确，保存数据并关闭注册窗口");

						axios
							.post(config.baseUrl + "user/reg", this.form)
							.then((response) => {
								console.log(response.data);
								var result = response.data;
								if (result.code == 0) {
									ElMessage.success(result.msg);
									this.regDialogVisible = false;
								} else {
									ElMessage.error(result.msg);
								}
							})
							.catch((e) => {
								this.errors.push(e);
							});
					} else {
						console.log("输入错误");
					}
				});
			},

			getLunbotuList() {
				axios
					.get(config.baseUrl + "article/getlunbotu")
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							//ElMessage.success(result.msg); 
							this.images = result.data
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
