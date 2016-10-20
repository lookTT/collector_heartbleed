collector_heartbleed
--------------
对存在滴血漏洞的主机进行数据采集
本人环境CentOS6.x

依赖的一些库
--------------
如下:

    $ yum install -y mysql-devel
    $ yum install -y lua
    $ yum install -y lua-devel


    $ wget http://luajit.org/download/LuaJIT-2.0.4.tar.gz
    $ tar zxvf LuaJIT-2.0.4.tar.gz
    $ cd LuaJIT-2.0.4
    $ make
    $ sudo make install


    $ wget http://luarocks.org/releases/luarocks-2.4.0.tar.gz
    $ tar zxvf luarocks-2.4.0.tar.gz
    $ cd luarocks-2.4.0
    $ ./configure
    $ sudo make bootstrap


    $ luarocks install lua-cjson
    $ luarocks install lua-iconv
    $ luarocks install luasocket
    $ luarocks install luasql-mysql MYSQL_LIBDIR=/usr/lib64/mysql MYSQL_INCDIR=/usr/include/mysql
    $ luarocks install uuid

开始
--------------
例子:

    $ git clone https://github.com/lookTT/collector_heartbleed.git
    $ cd collector_heartbleed
    $ sh setup.sh
    $ sh start.sh


联系我
--------------
Email:zltdhr@gmail.com
