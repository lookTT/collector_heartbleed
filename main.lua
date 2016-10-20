
local http = require("socket.http")
local config = require("config")

local iconv = require("iconv")
local cd = iconv.new( "utf-8","gbk")

local config = require("config")
local luasql = require "luasql.mysql"
local env = assert (luasql.mysql())
local con = assert (env:connect(config.mysql_db, config.mysql_user, config.mysql_passwd, config.mysql_url, config.mysql_port))
local cur = nil

---
-- uri string 2 json string
-- @function [parent=#main]
-- @param #string str
-- @return #string
local urlDecode = function (str)
    --return CLF_DecodeURI(str)
    local s = string.gsub(str, "+", " ")
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end
---
-- json string 2 uri string
-- @function [parent=#main]
-- @param #string str
-- @return #string
local urlEncode = function (str)
    --return CLF_EncodeURI(str)
    local s = string.gsub(str, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    s = string.gsub(s, " ", "+")
    return s
end

--string 2 table
local jsonDecode = require("cjson").decode
--table 2 string
local jsonEncode = require("cjson").encode

local main = function ()
    local str = io.popen(config.command):read("*a")

    cur = assert(con:execute(string.format("SELECT * FROM `%s` WHERE `str`='%s';", config.mysql_table, str)))
    local row = cur:fetch ({}, "a")
    if not row then
        --没有任何数据
        local query = string.format("INSERT INTO %s (`str`,`times`) VALUES ('%s',NOW())", config.mysql_table, str)
        --执行插入
        con:execute("set names utf8;")
        assert (con:execute(query))
    end
end


local old = 0
local sum = 0
while 1 do
    local new = string.format("%.1f", os.clock())
    if new ~= old then
        old = new
        sum = sum + 1

        main() --执行多次该函数
    end
    
    if sum >= 5 then return end
end

--关闭
if cur then cur:close() end
if con then con:close() end
if env then env:close() end 
