---
--@module config
local m = {}

--api
m.command = "python heartbleed.py -p443 127.0.0.1"

--MySQL数据库
m.mysql_db = "test"
--MySQL数据库表名
m.mysql_table = "miss"
--MySQL账号
m.mysql_user = "root"
--MySQL密码
m.mysql_passwd = "root"
--MySQL地址或IP
m.mysql_url = "127.0.0.1"
--MySQL端口号
m.mysql_port = 3306

return m

