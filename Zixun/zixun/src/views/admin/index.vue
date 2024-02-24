<template>
	<div class="menu">
		<div class="title">后台管理</div>
		<ul class="list">
			<li>
				<router-link style="color:#333;display:block;" :to="{ path: '/admin/article' }">资讯管理</router-link>
			</li>
			<li>
				<router-link style="color:#333;display:block;" :to="{ path: '/admin/index' }">用户管理</router-link>
			</li>
			<li>
				<router-link style="color:#333;display:block;" :to="{ path: '/admin/star' }">明星管理</router-link>
			</li>
		</ul>
	</div>

	<div class="content">
		<div class="title">用户管理</div>
		<div style="margin-bottom:10px;">
			<el-input v-model="searchName" style="width:200px;" placeholder="输入用户名" />
			<el-button type="warning" plain @click="handleSearch()">查找用户</el-button>
		</div>
		<el-table :data="tableData" border style="width: 100%">
			<el-table-column prop="username" label="用户名" width="80" />
			<el-table-column prop="pwd" label="密码" width="80" />
			<el-table-column prop="sex" label="性别" width="60" />
			<el-table-column prop="age" label="年龄" width="60" />
			<el-table-column prop="tel" label="电话" />
			<el-table-column label="评论" width="60">
				<template v-slot="scope">
					<i v-if="scope.row.pinglun===true" class="el-icon-close">允许</i>
					<i v-else class="el-icon-check">禁止</i>
				</template>
			</el-table-column>
			<el-table-column label="点赞" width="60">
				<template v-slot="scope">
					<i v-if="scope.row.dianzan===true" class="el-icon-close">允许</i>
					<i v-else class="el-icon-check">禁止</i>
				</template>
			</el-table-column>
			<el-table-column label="收藏" width="60">
				<template v-slot="scope">
					<i v-if="scope.row.shoucang===true" class="el-icon-close">允许</i>
					<i v-else class="el-icon-check">禁止</i>
				</template>
			</el-table-column>
			<el-table-column label="操作">
				<template v-slot="scope">
					<el-button size="small" @click="handleEdit(scope.row)">编辑</el-button>
					<el-button size="small" type="danger" @click="handleDelete(scope.row)">删除</el-button>
				</template>
			</el-table-column>
		</el-table>
		<el-dialog v-model="editDialog" title="用户编辑" width="400px" :before-close="editHandleClose">
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
					<el-input-number v-model="form.age" autocomplete="off"></el-input-number>
				</el-form-item>
				<el-form-item label="联系电话" label-width="90px" prop="tel">
					<el-input v-model="form.tel" autocomplete="off"></el-input>
				</el-form-item>
				<el-form-item label="评论权限" label-width="90px" prop="pinglun">
					<el-switch v-model="form.pinglun" inline-prompt active-text="是" inactive-text="否"> </el-switch>
				</el-form-item>
				<el-form-item label="点赞权限" label-width="90px" prop="pinglun">
					<el-switch v-model="form.dianzan" inline-prompt active-text="是" inactive-text="否"> </el-switch>
				</el-form-item>
				<el-form-item label="收藏权限" label-width="90px" prop="pinglun">
					<el-switch v-model="form.shoucang" inline-prompt active-text="是" inactive-text="否"> </el-switch>
				</el-form-item>
			</el-form>
			<div class="dialog-footer" style="text-align: center; margin-top: 40px">
				<el-button @click="editHandleClose">取 消</el-button>
				<el-button type="primary" @click="editHandleSave">确 定</el-button>
			</div>
		</el-dialog>
	</div>
</template>

<script>
	import {
		useRoute
	} from "vue-router";
	import {
		Search,
		Edit,
		Check,
		Message,
		Star,
		Delete
	} from '@element-plus/icons-vue'

	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";

	export default {
		name: "adminindex",

		setup() {
			const route = useRoute();
			console.log(route.params);
		},

		components: {
			Search,
			Edit,
			Check,
			Message,
			Star,
			Delete,
		},

		created() {
			this.user = JSON.parse(localStorage.getItem("user"));
			this.getUserList();

		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				categoryId: 0,
				route: useRoute(),
				user: JSON.parse(localStorage.getItem("user")),
				tableData: [],
				editDialog: false,
				form: {
					username: "",
					pwd: "",
					sex: "",
					age: "",
					tel: "",
				},
				searchName: '',
			};
		},

		methods: {
			getUserList() {
				axios
					.get(config.baseUrl + "user/getuserlist")
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							this.tableData = result.data;
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			handleEdit(row) {
				this.form = row;
				this.editDialog = true;

			},

			editHandleClose() {
				this.editDialog = false;
			},

			editHandleSave() {
				axios
					.post(config.baseUrl + "user/modify", this.form)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.editDialog = false;
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			handleDelete(row) {
				axios
					.get(config.baseUrl + "user/delete?userid=" + row.id)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.getUserList();
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			handleSearch() {
				if (this.searchName == '') {
					this.getUserList();
				} else {
					axios
						.get(config.baseUrl + "user/search?username=" + this.searchName)
						.then((response) => {
							var result = response.data;
							if (result.code == 0) {
								this.tableData = result.data;
							} else {
								ElMessage.error(result.msg);
							}
						})
						.catch((e) => {
							this.errors.push(e);
						});
				}

			},
		},
	};
</script>

<style scoped>
	@import "@/assets/admin.css";
</style>
