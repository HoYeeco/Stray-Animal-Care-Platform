<script setup lang="ts">
import {reactive} from "vue";
import request from "../../utils/request";
import {ElMessage, ElMessageBox} from "element-plus";
import {Delete, Edit} from '@element-plus/icons-vue'

const data = reactive({
  name: null,
  records: [],
  pageNum: 1,
  pageSize: 5,
  total: 0,
  dialogFormVisible: false,
  form: {}
})

// 改进深拷贝方法，确保主键处理正确
const deepClone = (obj) => {
  if (!obj || typeof obj !== 'object') {
    return obj;
  }
  const clone = Array.isArray(obj) ? [] : {};
  for (const key in obj) {
    if (obj.hasOwnProperty(key)) {
      clone[key] = deepClone(obj[key]);
    }
  }
  return clone;
}

const load = () => {
  request.get(
      '/upload/records',{
        params:{
          reporter:data.reporter,
          name:data.name,
          species:data.species,
          pageNum:data.pageNum,
          pageSize: data.pageSize,
        }
      }
  ).then(res=>{
    console.log(res);
    data.records=res.data.records
    data.total=res.data.total
  })
}

load()

const reset = () => {
  data.name = null;
  load();
}

const handleAdd = () => {
  data.dialogFormVisible=true
  // 新增时确保没有主键值
  data.form = {
    // 清空可能存在的主键值
    uploadRecordId: null,
    // 其他默认值
  }
}

const save = () => {
  // 明确区分新增和更新
  if (data.form.uploadRecordId) {
    update();
  } else {
    add();
  }
}

const add = () => {
  // 新增时不应该传递uploadRecordId，让数据库自动生成
  const formData = {...data.form};
  delete formData.uploadRecordId; // 确保不传递主键
  
  request.post('/upload/records', formData).then(res=>{
    if (res.code === '200'){
      console.log(res)
      data.dialogFormVisible=false
      ElMessage.success("操作成功")
      load()
    }else {
      ElMessage.error(res.msg)
    }
  })
}

const update = () => {
  request.put('/upload/records', data.form).then(res=>{
    if (res.code === '200'){
      console.log(res)
      data.dialogFormVisible=false
      ElMessage.success("操作成功")
      load()
    }else {
      ElMessage.error(res.msg)
    }
  })
}

const handleUpdate = (row) => {
  // 使用改进的深拷贝方法
  data.form = deepClone(row);
  data.dialogFormVisible=true
}

const handleDelete = (row) => {
  ElMessageBox.confirm('删除数据后无法恢复，确认删除吗？','删除确认',{type:'warning'}).then(()=>{
    request.delete('/upload/records/'+row.uploadRecordId).then(res=>{
      if (res.code === '200'){
        console.log(res)
        data.dialogFormVisible=false
        ElMessage.success("操作成功")
        load()
      }else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()
}

const handleSelectionChange = (rows) => {
  data.ids = rows.map(row => row.uploadRecordId)
  console.log(data.ids)
}

const handleDeleteBatch = () => {
  if (data.ids.length === 0){
    ElMessage.warning('请选择数据')
    return
  }
  ElMessageBox.confirm('删除数据后无法恢复，确认删除吗？','删除确认',{type:'warning'}).then(()=>{
    request.delete('/upload/records',{data: data.ids}).then(res=>{
      if (res.code === '200'){
        console.log(res)
        data.dialogFormVisible=false
        ElMessage.success("操作成功")
        load()
      }else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()

}
</script>

<template>
  <div>
    <el-card>
        <el-input style="inline-size: 200px; margin-inline-end: 10px;" v-model="data.name" placeholder="请输入上报人"></el-input>
      <el-input style="inline-size: 200px; margin-inline-end: 10px;" v-model="data.name" placeholder="请输入动物名字"></el-input>
      <el-select style="inline-size: 100px; margin-inline-end: 10px;" v-model="data.species" placeholder="请选择物种">
        <el-option label="狗" value="狗"></el-option>
        <el-option label="猫" value="猫"></el-option>
        <el-option label="其他" value="其他"></el-option>
      </el-select>
      <el-button type="primary" @click="load">查询</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </el-card>

    <el-card>
      <el-button type="success" @click="handleAdd">新增</el-button>
      <el-button type="warning" @click="handleDeleteBatch">批量删除</el-button>
      <el-button type="primary">导入</el-button>
      <el-button type="danger">导出</el-button>
    </el-card>

    <el-card text-align="center">
      <el-table :data="data.records" stripe @selection-change="handleSelectionChange">
        <el-table-column type="selection"></el-table-column>
        <el-table-column label="上报人" prop="reporter" width="80px"></el-table-column>
        <el-table-column label="联系电话" prop="reporterPhone" width="120px"></el-table-column>
        <el-table-column label="动物名字" prop="name" width="80px"></el-table-column>
        <el-table-column label="物种" prop="species" width="60px"></el-table-column>
        <el-table-column label="性别" prop="gender" width="60px"></el-table-column>
        <el-table-column label="健康状态" prop="healthStatus" width="140px"></el-table-column>
        <el-table-column label="绝育状态" prop="sterilizationStatus" width="80px"></el-table-column>
        <el-table-column label="发现时间" prop="discoveryTime" width="100px"></el-table-column>
        <el-table-column label="发现地点" prop="discoveryPlace" width="350px"></el-table-column>
        <el-table-column label="补充描述" prop="description" width="250px"></el-table-column>
        <el-table-column label="操作">
          <template #default="scope" style="inline-size: 120px">
            <el-button type="primary" :icon="Edit" circle @click="handleUpdate(scope.row)" />
            <el-button type="danger" :icon="Delete" circle @click="handleDelete(scope.row)"/>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-card>
      <el-pagination
          @size-change="load"
          @current-change="load"
          v-model:current-page="data.pageNum"
          v-model:page-size="data.pageSize"
          :page-sizes="[5,10,15,20]"
          :pager-count="11"
          background
          layout="total, sizes, prev, pager, next,jumper"
          :total="data.total"
      />
    </el-card>

  </div>

  <el-dialog v-model="data.dialogFormVisible" title="上报流浪动物记录" width="500">
    <el-form :model="data.form">
      <el-form-item label="上报人">
        <el-input v-model="data.form.reporter" autocomplete="off" />
      </el-form-item>
      <el-form-item label="联系电话">
        <el-input v-model="data.form.reporterPhone" autocomplete="off" />
      </el-form-item>
      <el-form-item label="动物名字">
        <el-input v-model="data.form.name" autocomplete="off" />
      </el-form-item>
      <el-form-item label="动物物种">
        <el-select v-model="data.form.species" placeholder="请选择动物物种">
          <el-option label="狗" value="狗" />
          <el-option label="猫" value="猫" />
          <el-option label="其他" value="其他" />
        </el-select>
      </el-form-item>
      <el-form-item label="动物性别">
        <el-button :type="data.form.gender === '母' ? 'primary' : ''" @click="data.form.gender = '母'">母</el-button>
        <el-button :type="data.form.gender === '公' ? 'primary' : ''" @click="data.form.gender = '公'">公</el-button>        
      </el-form-item>
      <el-form-item label="健康状态">
        <el-input v-model="data.form.healthStatus" autocomplete="off" placeholder="请输入动物健康状态" />
      </el-form-item>
      <el-form-item label="动物绝育状态">
        <el-select v-model="data.form.sterilizationStatus" placeholder="请选择动物绝育状态">
          <el-option label="不详" value="不详" />
          <el-option label="已绝育" value="已绝育" />
          <el-option label="未绝育" value="未绝育" />
        </el-select>
      </el-form-item>
      <el-form-item label="发现时间">
        <el-date-picker v-model="data.form.discoveryTime" type="date" placeholder="请选择一个日期" style="inline-size: 100%" />
      </el-form-item>
      <el-form-item label="发现地点">
        <el-input v-model="data.form.discoveryPlace" autocomplete="off" placeholder="请输入动物发现地点" />
      </el-form-item>
      <el-form-item label="动物描述">
        <el-input v-model="data.form.description" autocomplete="off" placeholder="请输入动物描述" />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="data.dialogFormVisible = false">
          取消
        </el-button>
        <el-button type="primary" @click="save()">
          保存
        </el-button>
      </div>
    </template>
  </el-dialog>

</template>

<style scoped>
.el-card :deep(.el-table) {
  text-align: center !important;
}
.el-card :deep(.el-table .cell) {
  text-align: center !important;
}
</style>



