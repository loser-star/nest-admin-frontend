# 使用官方的Node.js镜像作为基础镜像
FROM node:latest

# 设置工作目录为/app
WORKDIR /app

# 复制package.json和package-lock.json（如果有）到容器中
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制所有文件到容器中
COPY . .

# 启动开发服务器
CMD ["npm", "run", "serve"]


