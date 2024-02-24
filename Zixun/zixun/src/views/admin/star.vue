<template>
	<div class="menu">
		<div class="title">后台管理</div>
		<ul class="list">
			<li>
				<router-link style="color: #333; display: block" :to="{ path: '/admin/article' }">资讯管理</router-link>
			</li>
			<li>
				<router-link style="color: #333; display: block" :to="{ path: '/admin/index' }">用户管理</router-link>
			</li>
			<li>
				<router-link style="color: #333; display: block" :to="{ path: '/admin/star' }">明星管理</router-link>
			</li>
		</ul>
	</div>

	<div class="content">
		<div class="title">明星管理</div>
		<div style="margin-bottom:10px;">
			<el-input v-model="searchName" style="width:200px;" placeholder="输入要查找明星姓名" />
			<el-button type="warning" plain @click="handleSearch()">查找明星</el-button>
			<el-button @click="handleAddStar()" type="primary" plain>添加明星</el-button>
		</div>

		<el-table :data="starlist" border style="width: 100%">
			<el-table-column prop="name" label="明星" width="100" />
			<el-table-column prop="img" label="明星图片">
				<template v-slot="scope">
					<el-image style="width: 50px; height: 50px" :src="imgUrl + scope.row.img" fit="cover"></el-image>
				</template>
			</el-table-column>
			<el-table-column label="操作" width="150">
				<template v-slot="scope">
					<el-button size="small" @click="handleEdit(scope.row)">编辑</el-button>
					<el-button size="small" type="danger" @click="handleDelete(scope.row)">删除</el-button>
				</template>
			</el-table-column>
		</el-table>

		<el-dialog v-model="starDialog" :title="starTitle" width="600px" :before-close="addHandleClose">
			<el-form :model="form" ref="starForm">
				<el-form-item label="明星姓名" label-width="90px" prop="title">
					<el-input v-model="form.name" autocomplete="off"></el-input>
				</el-form-item>

				<el-form-item label="明星简介" label-width="90px" prop="content">
					<el-input v-model="form.desc" type="textarea" :autosize="{ minRows: 2, maxRows: 6 }"></el-input>
				</el-form-item>

				<el-form-item label="明星图片" label-width="90px" prop="img">
					<el-upload class="upload-demo" :action="uploadurl" :on-preview="handlePreview"
						:on-remove="handleRemove" :before-remove="beforeRemove" :on-success="uploadSuccess" multiple
						:limit="3" :on-exceed="handleExceed" :file-list="fileList">
						<el-button size="small" type="primary">点击上传</el-button>

						<template #tip>
							<div class="el-upload__tip">
								只能上传 jpg/png 文件，且不超过 500kb，如果上传新图片会自动替代旧图片。
							</div>
						</template>
					</el-upload>
				</el-form-item>
			</el-form>
			<div class="dialog-footer" style="text-align: center; margin-top: 40px">
				<el-button @click="addHandleClose">取 消</el-button>
				<el-button type="primary" @click="addHandleSave">确 定</el-button>
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
		Delete,
	} from "@element-plus/icons-vue";
	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";

	export default {
		name: "adminstar",

		setup() {
			const route = useRoute();
			console.log(route.params);
		},

		created() {
			this.user = JSON.parse(localStorage.getItem("user"));
			this.getstarlist();
		},

		components: {
			Search,
			Edit,
			Check,
			Message,
			Star,
			Delete,
		},

		data() {
			return {
				user: JSON.parse(localStorage.getItem("user")),
				categoryId: 0,
				route: useRoute(),
				starlist: [],
				imgUrl: config.imgUrl,
				form: {
					name: "",
					img: "",
					id: 0,
					desc: '',
				},
				starDialog: false,
				starTitle: "",
				uploadurl: config.baseUrl + "upload",
				searchName: "",
			};
		},

		watch: {
			/**
			 * 监测路由参数的变化
			 */
			$route() {
				this.categoryId = this.route.params.id;
				console.log("重新请求" + this.categoryId + "的数据");
			},
		},

		methods: {
			handleAddStar() {
				this.starTitle = "添加新明星";
				this.starDialog = true;
			},
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

			addHandleClose() {
				this.starDialog = false;
			},

			handleEdit(row) {
				this.form = row;
				this.starTitle = "编辑明星";
				this.starDialog = true;
			},

			addHandleSave() {
				var url = "";
				if (this.starTitle == "添加新明星") {
					url = config.baseUrl + "star/add";
				} else {
					url = config.baseUrl + "star/edit";
				}
				axios
					.post(url, this.form)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.starDialog = false;
							this.getstarlist();
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},

			uploadSuccess(response, file, fileList) {
				console.log(response.data.img);
				this.form.img = response.data.img;
			},
			
      handleDelete(row) {
				axios
					.get(config.baseUrl + "star/delete?starid=" + row.id)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.getstarlist();
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
					this.getstarlist();
				} else {
					console.log('start to search star ...')
					axios
						.get(config.baseUrl + "star/search?starname=" + this.searchName)
						.then((response) => {
							var result = response.data;
							console.log(result)
							if (result.code == 0) {
								this.starlist = result.data;
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
