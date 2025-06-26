<h1>Stray Animal Care Platform</h1>
<h2>城市流浪动物救助关爱平台</h2>
<h3>技术栈</h3>
<ol>
  <li>前后端分离：Spring Boot3 + MyBaits Plus + Vue3</li>
  <li>接口：Restful API</li>
  <li>数据库：MySQL</li>
</ol>
<h3>其他要求</h3>
<ol>
  <li>网页数≥10</li>
  <li>CRUD功能模块数≥3</li>
  <li>数据表&单表字段≥5</li>
</ol>

# 数据库创建建议

非常棒！我们聚焦于这个最核心的功能，这是典型的MVP（最小可行产品）开发思路，非常高效。

我们就从数据库开始，一步步来。

---

### 第一步：创建数据库

首先，我们创建一个专用于这个项目的数据库。我们将其命名为 `stray_animal_platform`。

**SQL命令:**

```sql
-- 创建数据库，如果它不存在的话
CREATE DATABASE IF NOT EXISTS `stray_animal_platform` 
DEFAULT CHARACTER SET utf8mb4 
DEFAULT COLLATE utf8mb4_unicode_ci;
```

> **小提示:**
> *   `utf8mb4` 是 `utf8` 的超集，能支持更广泛的字符，包括emoji表情，推荐使用。
> *   `utf8mb4_unicode_ci` 是一种排序规则，不区分大小写，在查询时很方便。

---

### 第二步：创建动物信息表

接下来，我们使用刚刚创建的数据库，并建立一张核心的动物信息表 `t_animal`。这张表将包含所有卡片上需要展示的信息。

**SQL命令:**

```sql
-- 切换到我们的数据库
USE `stray_animal_platform`;

-- 创建动物信息表
CREATE TABLE `t_animal` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` VARCHAR(50) NOT NULL COMMENT '动物昵称',
  `type` VARCHAR(20) NOT NULL COMMENT '动物类别 (例如: 猫, 狗)',
  `breed` VARCHAR(50) DEFAULT '' COMMENT '品种 (例如: 中华田园猫, 拉布拉多)',
  `gender` VARCHAR(10) NOT NULL COMMENT '性别 (雄性, 雌性)',
  `age` VARCHAR(20) DEFAULT '' COMMENT '年龄描述 (例如: 约2岁, 3个月)',
  `health_status` VARCHAR(255) DEFAULT '' COMMENT '健康状况 (例如: 已绝育, 已疫苗, 已驱虫)',
  `description` TEXT COMMENT '性格/故事描述',
  `image_url` VARCHAR(512) NOT NULL COMMENT '动物照片的URL',
  `status` VARCHAR(20) NOT NULL DEFAULT '待领养' COMMENT '状态 (待领养, 审核中, 已领养)',
  `city` VARCHAR(50) DEFAULT '' COMMENT '所在城市',
  `contact_info` VARCHAR(100) NOT NULL COMMENT '上传者联系方式 (电话/微信)',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='动物信息表';
```

**表结构设计说明:**

*   `id`: 使用`BIGINT`自增主键，是标准实践。
*   `name`, `type`, `gender`, `contact_info`: 设置为`NOT NULL`，因为这些是发布信息的核心要素。
*   `age`: 使用`VARCHAR`而不是`INT`，因为用户输入可能是“约2岁”、“成年”这样的模糊描述，更加灵活。
*   `image_url`: 存储图片的URL地址，而不是图片本身。将图片文件上传到服务器的特定目录或云存储（如OSS），数据库只存其访问路径，这是最佳实践。
*   `description`: 使用`TEXT`类型，可以存储较长的故事描述。
*   `status`: 默认为“待领养”，方便新数据录入。
*   `create_time`, `update_time`: 记录创建和更新时间，非常有用。

---

### 第三步：插入初始（模拟）数据

为了让你的前端页面一搭建好就能看到效果，我们向 `t_animal` 表中插入几条模拟数据。

**SQL命令:**

```sql
-- 插入一些初始数据用于测试
INSERT INTO `t_animal` 
(`name`, `type`, `breed`, `gender`, `age`, `health_status`, `description`, `image_url`, `city`, `contact_info`) 
VALUES
('橘子', '猫', '中华田园猫', '雄性', '约1岁', '已绝育, 已疫苗', '非常亲人，喜欢蹭人的腿，呼噜声很大，是一只粘人的小猫咪。', 'https://i.imgur.com/s4CHPEy.jpeg', '上海', '微信号: testuser1'),
('豆包', '狗', '柯基', '雌性', '2岁', '已疫苗, 已驱虫', '活泼可爱，精力旺盛，喜欢玩球和飞盘，已经学会坐下、握手等基本指令。', 'https://i.imgur.com/eBw1YfI.jpeg', '北京', '电话: 13800138001'),
('警长', '猫', '黑猫', '雄性', '约3岁', '已绝育, 已疫苗', '一只耳朵是折的，很有特点。性格高冷，但内心温柔，熟悉了之后会让你摸肚子。', 'https://i.imgur.com/a4wZ2H6.jpeg', '深圳', '微信号: testuser2'),
('雪球', '狗', '萨摩耶', '雌性', '6个月', '疫苗接种中', '微笑天使，性格温顺，不乱叫，对小孩和其它小动物都很友好。', 'https://i.imgur.com/M6wT0g9.jpeg', '广州', '电话: 13800138002');
```

> **图片说明:** 我为你找了一些可用的网络图片URL，你可以直接使用。这样你前端在获取数据后，可以直接渲染出图片，看到“动物卡片”的真实效果。

至此，你的数据库准备工作已经 **全部完成**！你现在有了一个包含初始数据的 `t_animal` 表。

---

### 下一步行动计划

有了数据库基础，接下来的开发路线就非常清晰了：

1.  **后端 (Spring Boot + MyBatis Plus):**
    *   在`pom.xml`中引入`mysql-connector-java`和`mybatis-plus-boot-starter`依赖。
    *   在`application.properties`或`application.yml`中配置好数据库连接信息。
    *   创建一个`Animal.java`实体类，其字段与`t_animal`表的列一一对应，并使用MyBatis Plus的注解（如`@TableName`, `@TableId`）进行映射。
    *   创建一个`AnimalMapper.java`接口，继承`BaseMapper<Animal>`。
    *   创建一个`AnimalController.java`，编写两个核心API：
        *   **获取列表API:** `GET /api/animals` - 用于查询数据库中所有动物信息，返回一个列表。前端用这个API来展示所有的动物卡片。
        *   **新增动物API:** `POST /api/animals` - 用于接收前端传来的动物信息（包括图片文件）。这个接口会复杂一些，需要处理`multipart/form-data`请求，将图片保存到服务器本地，然后将包含图片URL的动物信息存入数据库。

2.  **前端 (Vue3):**
    *   使用`axios`请求后端的`GET /api/animals`接口，获取到动物数据列表。
    *   使用`v-for`指令遍历数据，将每条动物信息渲染成一个漂亮的“动物卡片”组件。
    *   创建一个“发布信息”的页面/弹窗，包含一个表单，让用户填写动物信息并上传图片。
    *   当用户点击提交时，将表单数据和图片文件打包成一个`FormData`对象，通过`axios`以`POST`方式发送到后端的`POST /api/animals`接口。
    *   提交成功后，可以刷新动物列表，新发布的卡片就会出现了。

这个核心功能模块虽小，但五脏俱全，涵盖了前后端交互、文件上传、数据库操作等关键技术点。祝你编码顺利！
