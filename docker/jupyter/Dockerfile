FROM jupyter/scipy-notebook:x86_64-ubuntu-22.04
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --no-cache-dir jupyterlab-language-pack-zh-CN
COPY config/jupyter_lab_config.py /etc/jupyter/
EXPOSE 8888