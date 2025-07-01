<script setup lang="ts">
import {reactive} from "vue";
import request from "../../utils/request";
import {ElMessage, ElMessageBox} from "element-plus";
import {Delete, Edit} from '@element-plus/icons-vue'

const data = reactive({
  name: null,
  info: [],
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
      '/adoption/info',{
        params:{
          name:data.name,
          species:data.species,
          adoptionStatus:data.adoptionStatus,
          pageNum:data.pageNum,
          pageSize: data.pageSize,
        }
      }
  ).then(res=>{
    console.log(res);
    data.info=res.data.info
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
    adoptionInfoId: null,
    // 其他默认值
  }
}

const save = () => {
  // 明确区分新增和更新
  if (data.form.adoptionInfoId) {
    update();
  } else {
    add();
  }
}

const add = () => {
  const formData = {...data.form};
  delete formData.adoptionInfoId; // 确保不传递主键
  
  request.post('/adoption/info', formData).then(res=>{
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
  request.put('/adoption/info', data.form).then(res=>{
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
    request.delete('/adoption/info/'+row.adoptionInfoId).then(res=>{
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
  data.ids = rows.map(row => row.adoptionInfoId)
  console.log(data.ids)
}

const handleDeleteBatch = () => {
  if (data.ids.length === 0){
    ElMessage.warning('请选择数据')
    return
  }
  ElMessageBox.confirm('删除数据后无法恢复，确认删除吗？','删除确认',{type:'warning'}).then(()=>{
    request.delete('/adoption/info',{data: data.ids}).then(res=>{
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
    <el-select>
      <el-input style="inline-size: 200px; margin-inline-end: 10px;" v-model="data.name" placeholder="请输入动物名字"></el-input>
      <el-select style="inline-size: 100px; margin-inline-end: 10px;" v-model="data.species" placeholder="请选择物种">
        <el-option label="狗" value="狗"></el-option>
        <el-option label="猫" value="猫"></el-option>
        <el-option label="其他" value="其他"></el-option>
      </el-select>
    </el-select>
    <el-select style="inline-size: 100px; margin-inline-end: 10px;" v-model="data.adoptionStatus" placeholder="请选择领养状态">
      <el-option label="待领养" value="待领养"></el-option>
      <el-option label="已被领养" value="已被领养"></el-option>
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

    <el-card>
      <div class="animal-cards">
        <el-card
          v-for="animal in data.info"
          :key="animal.adoptionInfoId"
          class="animal-card"
          shadow="hover"
        >
          <img :src="animal.imageUrl" alt="{{ animal.name }}" class="animal-image" />
          <h3>{{ animal.name }}</h3>
          <p><strong>物种:</strong> {{ animal.species }}</p>
          <p><strong>性别:</strong> {{ animal.gender }}</p>
          <p><strong>健康状态:</strong> {{ animal.healthStatus }}</p>
          <p><strong>绝育状态:</strong> {{ animal.sterilizationStatus }}</p>
          <p><strong>所在基地:</strong> {{ animal.baseName }}</p>
          <p><strong>发现时间:</strong> {{ animal.discoveryTime }}</p>
          <p><strong>发现地点:</strong> {{ animal.discoveryPlace }}</p>
          <p><strong>补充描述:</strong> {{ animal.description }}</p>
          <p><strong>领养状态:</strong> {{ animal.adoptionStatus }}</p>
          <p v-if="animal.adoptedTime"><strong>被领养时间:</strong> {{ animal.adoptedTime }}</p>
          <div class="card-actions">
            <el-button type="primary" :icon="Edit" circle @click="handleUpdate(animal)" />
            <el-button type="danger" :icon="Delete" circle @click="handleDelete(animal)"/>
          </div>
        </el-card>
      </div>
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
</template>

<style scoped>
.el-card :deep(.el-table) {
  text-align: center !important;
}
.el-card :deep(.el-table .cell) {
  text-align: center !important;
}

.animal-cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
}

.animal-card {
  transition: transform 0.2s;
}

.animal-card:hover {
  transform: translateY(-5px);
}

.animal-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
  margin-bottom: 10px;
}

.card-actions {
  margin-top: 10px;
  text-align: center;
}
</style>
