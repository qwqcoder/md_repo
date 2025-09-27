# 创建容器

```sh
docker run -d \
  --name mysql8 \
  -p 3307:3306 \
  -e MYSQL_ROOT_PASSWORD=Wx.76002 \
  -e MYSQL_DATABASE=initial_db \  # 初始化时创建的数据库
  -e MYSQL_USER=qwqcoder \     # 额外创建的用户
  -e MYSQL_PASSWORD=Wx.76002 \ # 自定义用户的密码
  -v mysql_data:/var/lib/mysql \  # 数据卷持久化数据
  -v ~/workspace/container_conf/mysql8:/etc/mysql/conf.d \  # 挂载自定义配置文件
  --restart=always \  # 容器退出时自动重启
  mysql:8.0
  
  docker run -d \
  --name mysql8 \
  -p 3307:3306 \
  --network sql_net \
  -e MYSQL_ROOT_PASSWORD=Wx.76002 \
  -e MYSQL_DATABASE=initial_db \
  -e MYSQL_USER=qwqcoder \
  -e MYSQL_PASSWORD=Wx.76002 \
  -v mysql_data:/var/lib/mysql \
  -v ~/workspace/container_conf/mysql8:/etc/mysql/conf.d \
  --restart=always \
  mysql:8.0 \
  --default-authentication-plugin=mysql_native_password
  
docker run \
--name zyplayer \
-v ~/workspace/volume_tmp:/tmp \
-p 8083:8083 \
--network sql_net \
--restart=always \
-d zyplayer:latest
```



# 构建镜像

> 一个基础的 Dockerfile 通常包含以下部分：
>
> 1. **基础镜像**（`FROM`）：指定构建镜像的基础
> 2. **维护者信息**（`LABEL` 或 `MAINTAINER`，推荐 `LABEL`）
> 3. **环境配置**（`ENV`）：设置环境变量
> 4. **文件操作**（`COPY` 或 `ADD`）：复制文件到镜像
> 5. **执行命令**（`RUN`）：构建时执行的命令
> 6. **暴露端口**（`EXPOSE`）：声明容器运行时的端口
> 7. **启动命令**（`CMD` 或 `ENTRYPOINT`）：容器启动时执行的命令

假设目录结构如下: 

```js
my-node-app/
├── Dockerfile
├── app.js
└── package.json
```

## 编写 Dockerfile

```dockerfile
# 基础镜像：使用官方Node.js 18版本（Alpine精简版）
# FROM openjdk:8-jdk-slim
FROM node:18-alpine

# 维护者信息
LABEL maintainer="yourname@example.com"

# 设置工作目录（容器内的目录）
# 指定后续命令的工作目录（相当于容器中执行一次 cd /app）
WORKDIR /app

# 复制package.json和package-lock.json到工作目录
# COPY app.jar ./app.jar
COPY package*.json ./

# 安装依赖
RUN npm install --production

# 复制应用代码到工作目录
COPY . .

# 暴露端口（Node.js应用通常用3000）
# EXPOSE 8088
EXPOSE 3000

# 启动命令：运行app.js
CMD ["node", "app.js"]

```

### 构建镜像

```sh
# 在 Dockerfile 的目录下执行命令

# 语法：docker build -t 镜像名称:标签 .
docker build -t my-node-app:1.0 .
```

