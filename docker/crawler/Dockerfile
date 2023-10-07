# 使用官方的Python基础镜像
FROM python:3.9

# 设置工作目录
WORKDIR /app

# 将当前目录的内容复制到工作目录中
COPY . /app

# 安装依赖
RUN pip install --no-cache-dir -r ./requirements.txt

