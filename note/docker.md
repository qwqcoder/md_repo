Docker 是一个用于开发、发布和运行应用程序的开放平台。以下是一些常用的 Docker 命令行操作：

### 1. **镜像操作**
- **拉取镜像**：从 Docker Hub 或其他镜像仓库拉取镜像。
  ```bash
  docker pull <image_name>:<tag>
  ```

- **列出本地镜像**：查看本地已有的 Docker 镜像。
  
  ```bash
  docker images
  ```
  
- **删除镜像**：删除本地的 Docker 镜像。
  ```bash
  docker rmi <image_id>
  ```

- **构建镜像**：根据 Dockerfile 构建镜像。
  ```bash
  docker build -t <image_name>:<tag> .
  ```

### 2. **容器操作**
- **运行容器**：从镜像启动一个新的容器。
  ```bash
  docker run <image_name>:<tag>
  ```

- **列出运行中的容器**：查看当前正在运行的容器。
  ```bash
  docker ps
  ```

- **列出所有容器**：查看所有容器（包括已停止的）。
  ```bash
  docker ps -a
  ```

- **启动/停止容器**：启动或停止一个已存在的容器。
  ```bash
  docker start <container_id>
  docker stop <container_id>
  ```

- **重启容器**：重启一个正在运行的容器。
  ```bash
  docker restart <container_id>
  ```

- **删除容器**：删除一个已停止的容器。
  ```bash
  docker rm <container_id>
  ```

- **进入容器**：进入正在运行的容器的命令行。
  ```bash
  docker exec -it <container_id> /bin/bash
  ```

- **查看容器日志**：查看容器的日志输出。
  ```bash
  docker logs <container_id>
  ```

### 3. **网络操作**
- **列出网络**：查看 Docker 网络。
  ```bash
  docker network ls
  ```

- **创建网络**：创建一个新的 Docker 网络。
  ```bash
  docker network create <network_name>
  ```

- **连接容器到网络**：将容器连接到指定的网络。
  ```bash
  docker network connect <network_name> <container_id>
  ```

- **断开容器与网络的连接**：将容器从指定的网络断开。
  ```bash
  docker network disconnect <network_name> <container_id>
  ```

### 4. **数据卷操作**
- **创建数据卷**：创建一个新的数据卷。
  ```bash
  docker volume create <volume_name>
  ```

- **列出数据卷**：查看所有的数据卷。
  ```bash
  docker volume ls
  ```

- **删除数据卷**：删除一个数据卷。
  ```bash
  docker volume rm <volume_name>
  ```

### 5. **其他常用命令**
- **查看 Docker 信息**：查看 Docker 系统信息。
  ```bash
  docker info
  ```

- **查看 Docker 版本**：查看 Docker 客户端和服务端的版本信息。
  ```bash
  docker version
  ```

- **清理未使用的资源**：删除未使用的镜像、容器、网络和数据卷。
  ```bash
  docker system prune
  ```

- **强制删除所有容器和镜像**：删除所有容器和镜像（慎用）。
  ```bash
  docker system prune -a --volumes
  ```

这些命令涵盖了 Docker 的常见操作，帮助你管理镜像、容器、网络和数据卷等资源。