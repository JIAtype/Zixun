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
		<div class="title">资讯管理</div>
		<div style="margin-bottom:10px;">
			<el-input v-model="searchTitle" style="width:200px;" placeholder="输入要查找关键字" />
			<el-button type="warning" plain @click="handleSearch()">查找资讯</el-button>
			<el-button type="primary" plain @click="handleAdd">新增资讯</el-button>
		</div>

		<el-table :data="tableData" border style="width: 100%">
			<el-table-column prop="catname" label="资讯分类" width="100" />
			<el-table-column prop="postdate" label="发布时间" width="160" />
			<el-table-column prop="title" label="资讯标题" />
			<el-table-column label="操作" width="150">
				<template v-slot="scope">
					<el-button size="small" @click="handleEdit(scope.row)">编辑</el-button>
					<el-button size="small" type="danger" @click="handleDelete(scope.row)">删除</el-button>
				</template>

			</el-table-column>
		</el-table>

		<el-dialog v-model="articleDialog" :title="dialogTitle" width="400px" :before-close="addHandleClose">
			<el-form :model="form" :rules="rules" ref="articleForm">
				<el-form-item label="标题" label-width="90px" prop="title">
					<el-input v-model="form.title" autocomplete="off"></el-input>
				</el-form-item>
				<el-form-item label="作者" label-width="90px" prop="author">
					<el-input v-model="form.author" autocomplete="off"></el-input>
				</el-form-item>
				<el-form-item label="发布日期" label-width="90px" prop="author">
					<el-date-picker v-model="form.postdate" type="datetime" placeholder="选择日期"></el-date-picker>
				</el-form-item>
				<el-form-item label="分类" label-width="90px" prop="catid">
					<el-select v-model="form.catid" placeholder="请选文章分类">
						<el-option v-for="item in options" :key="item.value" :value="item.value" :label="item.label">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item label="关联明星" label-width="90px" prop="catid">
					<el-select v-model="form.starid" placeholder="请选明星">
						<el-option v-for="item in starlist" :key="item.id" :value="item.id" :label="item.name">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item label="缩略图" label-width="90px" prop="img">
					<el-upload class="upload-demo" :action="uploadurl" :on-preview="handlePreview"
						:on-remove="handleRemove" :before-remove="beforeRemove" :on-success="uploadSuccess" multiple
						:limit="3" :on-exceed="handleExceed" :file-list="fileList">
						<el-button size="small" type="primary">点击上传</el-button>
						<template #tip>
							<div class="el-upload__tip">只能上传 jpg/png 文件，且不超过 500kb</div>
						</template>
					</el-upload>
				</el-form-item>
				<el-form-item label="文章内容" label-width="90px" prop="content">
					<el-input v-model="form.content" :autosize="{ minRows: 2, maxRows:10 }" type="textarea"></el-input>
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
		Delete
	} from '@element-plus/icons-vue'
	import config from "@/api/config.js";
	import axios from "axios";
	import {
		ElMessage
	} from "element-plus";
	import qs from "qs";

	export default {
		name: "article",

		setup() {
			const route = useRoute();
			console.log(route.params);
		},

		created() {
			this.user = JSON.parse(localStorage.getItem("user"));
			this.getArticleList();
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
				tableData: [],
				articleDialog: false,
				form: {
					title: "",
					content: "",
					author: "",
					postdate: "",
					img: "",
					catid: "",
					zancount: 0,
					hitcount: 0,
					id: 0,
				},
				searchTitle: '',
				uploadurl: config.baseUrl + "upload",
				dialogTitle: '',
				starlist: [],
				fileList: [],
				options: [{
						label: '明星资讯',
						value: 1,
					},
					{
						label: '电影资讯',
						value: 2,
					},
					{
						label: '电视资讯',
						value: 3,
					},
					{
						label: '音乐资讯',
						value: 4,
					},
					{
						label: '体育资讯',
						value: 5,
					},
				],

			};
		},

		methods: {
			getArticleList() {
				axios
					.post(config.baseUrl + "article/getall")
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

			handleAdd() {
				this.form = this.$options.data().form
				this.dialogTitle = '发布新文章';
				this.articleDialog = true;
			},

			handleRemove(file, fileList) {
				console.log(file, fileList)
			},
			
      handlePreview(file) {
				console.log(file)
			},
			
      handleExceed(files, fileList) {
				this.$message.warning(
					`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${
          files.length + fileList.length
        } 个文件`
				)
			},
			
      beforeRemove(file, fileList) {
				return this.$confirm(`确定移除 ${file.name}？`)
			},
			
      uploadSuccess(response, file, fileList) {
				console.log(response.data.img);
				this.form.img = response.data.img;
			},
			
      addHandleSave() {
				var url = '';
				if (this.dialogTitle == '发布新文章') {
					url = config.baseUrl + "article/add"
				} else {
					url = config.baseUrl + "article/edit"
				}
				axios
					.post(url, this.form)
					.then((response) => {
						console.log(response.data);
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.$refs.articleForm.resetFields();
							this.articleDialog = false;
							this.getArticleList();

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
				this.dialogTitle = '编辑文章';
				this.articleDialog = true;
			},
			
      handleDelete(row) {
				axios
					.get(config.baseUrl + "article/delete?articleid=" + row.id)
					.then((response) => {
						var result = response.data;
						if (result.code == 0) {
							ElMessage.success(result.msg);
							this.getArticleList();
						} else {
							ElMessage.error(result.msg);
						}
					})
					.catch((e) => {
						this.errors.push(e);
					});
			},
			
      addHandleClose() {
				this.articleDialog = false;
			},
			
      handleSearch() {
				if (this.searchTitle == '') {
					this.getArticleList();
				} else {
					axios
						.get(config.baseUrl + "article/search?title=" + this.searchTitle)
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
		},
	};
</script>

<style scoped>
	@import "@/assets/admin.css";
</style>
