# 使用官方的Node.js镜像作为基础镜像
FROM node:latest as build-stage

# 设置工作目录为/app
WORKDIR /app

# 复制package.json和package-lock.json（如果有）到容器中
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制所有文件到容器中
COPY . .

# 构建项目
RUN npm run build

# 使用官方的Nginx镜像作为基础镜像
FROM nginx:latest as production-stage

# 复制Nginx配置文件
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# 将构建输出的文件复制到Nginx服务目录
COPY --from=build-stage /app/dist /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]