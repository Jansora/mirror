c.ServerApp.ip, c.ServerApp.port = '0.0.0.0', 8888
c.ServerApp.root_dir = '/home/jupyter/work'
c.ServerApp.password = 'argon2:$argon2id$v=19$m=10240,t=10,p=8$...'  # jupyter server password 生成