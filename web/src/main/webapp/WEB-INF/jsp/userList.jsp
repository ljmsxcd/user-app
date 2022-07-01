<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
</head>
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<body>
<%@include file="inc.jsp"%>

<div id="app" v-cloak>
    <div class="filter-container">
        <el-form :inline="true" :model="listQuery" ref="listQuery" :label-position="right" label-width="80px">

            <el-form-item label="姓名" prop="username">
                <el-input v-model="listQuery.username" placeholder="请输入" style="width: 200px;"></el-input>
            </el-form-item>


            <el-button class="filter-item" type="primary"  @click="searchFilter">查询</el-button>
            <el-button class="filter-item" type="primary"  @click="openAddNewWindow">新增</el-button>
            <el-button class="filter-item" type="primary"  @click="openEditWindow">编辑</el-button>
        </el-form>
    </div>
    <div class="table-container" style="text-align:center">
        <el-table ref="singleTable" :data="tableData"
                  highlight-current-row
                  @current-change="handleCurrentChange"
                  style="width: 50%"
                  stripe v-loading.body="listLoading" element-loading-text="Loading" border>
<%--            <el-table-column :selectable="isDisabled" type="selection" width="55"></el-table-column>--%>
            <el-table-column align="center" label='序号' width="60">
                <template slot-scope="scope">
                    {{scope.$index+1}}
                </template>
            </el-table-column>

            <el-table-column label="名字" align="center" prop="username" width="300">
            </el-table-column>
            <el-table-column label="邮箱" align="center" prop="email" width="300">
            </el-table-column>

            </el-table-column>

        </el-table>
    </div>
    <el-dialog  :visible.sync="addFormVisible" @close="resetForm('addForm')">
        <el-form :rules="rules" ref="addForm" :model="addForm" label-position="left" label-width="80px">
            <el-form-item label="姓名" prop="username">
                <el-input v-model="addForm.username" placeholder="请输入" style="width: 200px;"></el-input>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
                <el-input v-model="addForm.email" placeholder="请输入" style="width: 200px;"></el-input>
            </el-form-item>

        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="resetForm('addForm')">取 消</el-button>
            <el-button type="primary" bind-auth-url="/user/add" @click="submitAddForm('addForm')">保存</el-button>
        </div>
    </el-dialog>

    <el-dialog  :visible.sync="editFormVisible" @close="resetForm('editForm')">
        <el-form :rules="rules" ref="editForm" :model="editForm" label-position="left" label-width="80px">
            <el-form-item label="姓名" prop="username">
                <el-input v-model="editForm.username" placeholder="请输入" style="width: 200px;"></el-input>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
                <el-input v-model="editForm.email" placeholder="请输入" style="width: 200px;"></el-input>
            </el-form-item>

        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="resetForm('editForm')">取 消</el-button>
            <el-button type="primary" bind-auth-url="/user/update" @click="submitEditForm('editForm')">保存</el-button>
            <el-button type="primary" bind-auth-url="/user/update" @click="submitDeleteForm('editForm')">删除</el-button>
        </div>
    </el-dialog>
</div>
<script>
    Vue.prototype.$http = axios.create({
        timeout: 10000,
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        }
    });
    new Vue({
        el: '#app',
        data() {
            const validateEmail = (rule, value, callback) => {
                const emailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
                if (!emailReg.test(value)) {
                    callback(new Error('邮箱格式不正确'));
                } else {
                    callback()
                }
            };
            return {

                listQuery: {
                    username: ''
                },
                tableData: [],
                listLoading: false,
                pageNum: 1,
                pageSize: 20,
                addForm: {
                    username: '',
                    email: ''
                },
                addFormVisible: false,
                editForm: {
                    username: '',
                    email: null,
                    id: null
                },
                editFormVisible: false,
                rules: {
                    username: [
                        { required: true, message: '姓名不能为空', trigger: 'blur' }
                    ],
                    email: [
                        { required: true, message: '邮箱不能为空', trigger: 'blur' },
                        { validator: validateEmail, trigger: 'blur' }
                    ]
                },
                currentRow: null

            };
        },
        filters: {},
        created() {
        },
        methods: {
            searchFilter() {
                let _this = this;
                // _this.pageNum = 1;
                // _this.listQuery.version = 0;
                _this.fetchData();
            },
            fetchData() {
                let _this = this;

                _this.listLoading = true;
                _this.$http({
                    method: 'POST',
                    url: '/user/list',
                    data: {
                        'pageNum': _this.pageNum,
                        'pageSize': _this.pageSize,
                        'username': _this.listQuery.username
                    }

                }).then((res) => {
                    if (res.data.success) {
                        _this.tableData = res.data.data;
                    } else {
                        _this.$message({
                            type: 'warning',
                            message: res.data.message
                        });
                        _this.tableData = [];
                    }
                    _this.listLoading = false;
                }).catch((err) => {
                    console.log(err);
                    _this.listLoading = false;
                });

            },
            openAddNewWindow() {
                let _this = this;
                _this.addFormVisible = true;
            },
            resetForm(formName) {
                let _this = this;
                _this.$refs[formName].resetFields();
                _this.addFormVisible = false;
                _this.editFormVisible = false;
            },
            submitAddForm(formName) {
                let _this = this;
                _this.$refs[formName].validate((valid) => {
                    if (valid) {
                        _this.$http({
                            method: 'POST',
                            url: '/user/add',
                            data: _this.addForm
                        }).then((res) => {
                            if (res.data.success) {
                                _this.addFormVisible = false;
                                _this.resetForm(formName);
                                _this.fetchData();
                                _this.$message({
                                    type: 'success',
                                    message: '新增成功!'
                                })
                            } else {
                                _this.$message({
                                    type: 'warning',
                                    message: res.data.message
                                })
                            }
                        }).catch((err) => {
                            console.log(err);
                        });
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            handleCurrentChange(val) {
                this.currentRow = val;
            },
            openEditWindow() {
                let _this = this;
                if(_this.currentRow == null){
                    this.$message({
                        message: '没有选中行数据',
                        type: 'warning'
                    });

                    return false;
                }
                _this.editFormVisible = true;
                _this.editForm.username = _this.currentRow.username;
                _this.editForm.email = _this.currentRow.email;
                _this.editForm.id = _this.currentRow.id;
            },
            setCurrent(row) {
                this.$refs.singleTable.setCurrentRow(row);
            },
            submitEditForm(formName) {
                let _this = this;
                _this.$refs[formName].validate((valid) => {
                    if (valid) {
                        _this.$http({
                            method: 'POST',
                            url: '/user/edit',
                            data: _this.editForm
                        }).then((res) => {
                            if (res.data.success) {
                                _this.addFormVisible = false;
                                _this.currentRow = null;
                                _this.resetForm(formName);
                                _this.fetchData();
                                _this.$message({
                                    type: 'success',
                                    message: '编辑成功!'
                                })
                            } else {
                                _this.$message({
                                    type: 'warning',
                                    message: res.data.message
                                })
                            }
                        }).catch((err) => {
                            console.log(err);
                        });
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            submitDeleteForm(formName) {
                let _this = this;

                _this.$http({
                    method: 'POST',
                    url: '/user/delete',
                    data: _this.editForm
                }).then((res) => {
                    if (res.data.success) {
                        _this.editFormVisible = false;
                        _this.currentRow = null;
                        _this.resetForm(formName);
                        _this.fetchData();
                        _this.$message({
                            type: 'success',
                            message: '删除成功!'
                        })
                    } else {
                        _this.$message({
                            type: 'warning',
                            message: res.data.message
                        })
                    }
                }).catch((err) => {
                    console.log(err);
                });

            }
        }
    });
</script>


</body>
</html>