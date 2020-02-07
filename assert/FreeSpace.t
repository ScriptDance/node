
FreeSpace = {};
print = function (msg)
	-- body
	lineprint(msg);
end;

nLog = lineprint;

-- 启动服务
function FreeSpace:start()
	-- body
end

function FreeSpace:findView(r)
	-- body
	local cmd = "/find?"
	local res = FreeSpace:submit(cmd..makeRule(r));
	if res then
		local view = res.data[1];
		view['r'] = r;
		
		setmetatable(view,FreeSpace["viewDao"]);
		return view;
	end
end

function FreeSpace:findViews(r)
	-- body
	local cmd = "/find?"
	local res = FreeSpace:submit(cmd..makeRule(r));
	if res then
		for k,v in pairs(res.data) do
			setmetatable(v,FreeSpace["viewDao"]);
		end
		return res.data;
	end
end

function FreeSpace:click(r)
	-- body
	local cmd = "/cmd?a=click&"
	FreeSpace:submit(cmd..makeRule(r));
end

function FreeSpace:clickl(r)
	-- body
	local cmd = "/cmd?a=clickl&"
	FreeSpace:submit(cmd..makeRule(r));
end

function FreeSpace:input(r,msg)
	-- body
	local cmd = "/cmd?a=input&text="..msg.."&"
	FreeSpace:submit(cmd..makeRule(r));
end

function FreeSpace:slid(r,s)
	-- body
	local cmd = "/cmd?a=slid&value="..s.."&"
	FreeSpace:submit(cmd..makeRule(r));
end

function FreeSpace:key(v)
	-- body
	local cmd = "/cmd?a=key&value="..v;
	FreeSpace:submit(cmd);
end

function FreeSpace:cons(v)
	-- body
	local cmd = "/cons?value="..v;
	FreeSpace:submit(cmd);
end

function makeRule(r)
	-- body
	local josnR = JsonEncode(r.rule);
	return "rule="..urlEncode(josnR);
end

function FreeSpace:submit(order)
	-- body
	local host = "http://127.0.0.1:9090";
	
	nLog(host..order);
	
	local res = httprequest("get",host..order,"","utf-8");
	if res then
		nLog("FreeSpace-Result:"..res);
		local resT = JsonDecode(res)
		if resT.code == 1 then
			return resT;
		end
	else
		sysstartapp("com.freespace.aplug");
		toast("请先开启无障精灵 服务",1);
	end
end

rule = {}
function R()
	-- body
	local new  = {};
	rule.__index = rule;
	setmetatable(new,rule);
	new.rule={};
	return new;
end

function rule:text(str)
	-- body
	self.rule["text"] = str;
	return self;
end

function rule:id(str)
	-- body
	self.rule["id"] = str;
	return self;
end

function rule:type(str)
	-- body
	self.rule["type"] = str;
	return self;
end

function rule:desc(str)
	-- body
	self.rule["desc"] = str;
	return self;
end

function rule:clickable(r)
	-- body
	self.rule["clickable"] = b;
	return self;
end

function rule:hasChild(b)
	-- body
	self.rule["hasChild"] = b.rule;
	return self;
end

function rule:view(t)
	-- body
	self.rule["type"] = t;
	return self;
end

function rule:screen(s)
	-- body
	self.rule["screen"] = s;
	return self;
end

function rule:childCount(n)
	-- body
	self.rule["childCount"] = n;
	return self;
end

FreeSpace["viewDao"] = {};
FreeSpace["viewDao"].__index = FreeSpace["viewDao"];


function FreeSpace.viewDao:click()
	-- body
	FreeSpace:click(self.r);
	return self;
end

function FreeSpace.viewDao:lclick()
	-- body
	FreeSpace:lClick(self.r);
	return self;
end

function FreeSpace.viewDao:input(msg)
	-- body
	FreeSpace:input(self.r,msg);
	return self;
end


-- 兼容 免root
function find(r)
	-- body
	return FreeSpace:findView(r);
end

function finds(r)
	-- body
	return FreeSpace:findViews(r);
end

function click(r)
	return FreeSpace:click(r);
end

function clickl(r)
	return FreeSpace:clickl(r);
end

function input(r,msg)
	return FreeSpace:input(r,msg);
end

function slid(r,msg)
	return FreeSpace:slid(r,msg);
end

--模拟按键
function home()
	return FreeSpace:key("home");
end

function back()
	return FreeSpace:key("back");
end

function noti()
	return FreeSpace:key("noti");
end

function jobs()
	return FreeSpace:key("jobs");
end

function sleep(times)
	-- body
	mSleep(times);
end

function time(times)
	-- body
	return os.time();
end

function cons(s)
	-- body
	if s then
		FreeSpace:cons("1")
	else
		FreeSpace:cons("0")
	end
end

function toast(s)
    messagebox(s);
end































-----------------URL ENCODE
function urlEncode(s)
     s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)  
    return string.gsub(s, " ", "+")  
end
-----------------URL ENCODE

----------------JSON CODE

-----------------------------------JsonFormat


local encode,next_char
local parse,create_set

function create_set(...)
	local res = {}
	for i = 1, select("#", ...) do
		res[ select(i, ...) ] = true
	end
	return res
end


function JsonDecode(str)	--解Json格式
	if type(str) ~= "string" then
		error("expected argument of type string, got " .. type(str))
	end
	local res, idx = parse(str, next_char(str, 1, create_set(" ", "\t", "\r", "\n"), true))
	idx = next_char(str, idx, create_set(" ", "\t", "\r", "\n"), true)
	if idx <= #str then
		decode_error(str, idx, "trailing garbage")
	end
	return res
end

function JsonEncode(val)	--转Json格式
	return ( encode(val) )
end

local escape_char_map = {
	[ "\\" ] = "\\\\",
	[ "\"" ] = "\\\"",
	[ "\b" ] = "\\b",
	[ "\f" ] = "\\f",
	[ "\n" ] = "\\n",
	[ "\r" ] = "\\r",
	[ "\t" ] = "\\t",
}

local escape_char_map_inv = { [ "\\/" ] = "/" }
for k, v in pairs(escape_char_map) do
	escape_char_map_inv[v] = k
end


local function escape_char(c)
	return escape_char_map[c] or string.format("\\u%04x", c:byte())
end


local function encode_nil(val)
	return "null"
end


local function encode_table(val, stack)
	local res = {}
	stack = stack or {}

-- Circular reference?
	if stack[val] then error("circular reference") end

	stack[val] = true

	if val[1] ~= nil or next(val) == nil then
		-- Treat as array -- check keys are valid and it is not sparse
		local n = 0
		for k in pairs(val) do
			if type(k) ~= "number" then
				error("invalid table: mixed or invalid key types")
			end
			n = n + 1
		end
		if n ~= #val then
			error("invalid table: sparse array")
		end
		-- Encode
		for i, v in ipairs(val) do
			table.insert(res, encode(v, stack))
		end
		stack[val] = nil
		return "[" .. table.concat(res, ",") .. "]"

	else
		-- Treat as an object
		for k, v in pairs(val) do
			if type(k) ~= "string" then
				error("invalid table: mixed or invalid key types")
			end
			table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
		end
		stack[val] = nil
		return "{" .. table.concat(res, ",") .. "}"
	end
end


local function encode_string(val)
	return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
end


local function encode_number(val)
-- Check for NaN, -inf and inf
	if val ~= val or val <= -math.huge or val >= math.huge then
		error("unexpected number value '" .. tostring(val) .. "'")
	end
	return string.format("%.14g", val)
end


local type_func_map = {
	[ "nil"     ] = encode_nil,
	[ "table"   ] = encode_table,
	[ "string"  ] = encode_string,
	[ "number"  ] = encode_number,
	[ "boolean" ] = tostring,
}


encode = function(val, stack)
	local t = type(val)
	local f = type_func_map[t]
	if f then
		return f(val, stack)
	end
	error("unexpected type '" .. t .. "'")
end





-------------------------------------------------------------------------------
-- Decode
-------------------------------------------------------------------------------




local literal_map = {
	[ "true"  ] = true,
	[ "false" ] = false,
	[ "null"  ] = nil,
}


function next_char(str, idx, set, negate)
	for i = idx, #str do
		if set[str:sub(i, i)] ~= negate then
			return i
		end
	end
	return #str + 1
end


local function decode_error(str, idx, msg)
	local line_count = 1
	local col_count = 1
	for i = 1, idx - 1 do
		col_count = col_count + 1
		if str:sub(i, i) == "\n" then
			line_count = line_count + 1
			col_count = 1
		end
	end
	error( string.format("%s at line %d col %d", msg, line_count, col_count) )
end


local function codepoint_to_utf8(n)
-- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
	local f = math.floor
	if n <= 0x7f then
		return string.char(n)
	elseif n <= 0x7ff then
		return string.char(f(n / 64) + 192, n % 64 + 128)
	elseif n <= 0xffff then
		return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
	elseif n <= 0x10ffff then
		return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
			f(n % 4096 / 64) + 128, n % 64 + 128)
	end
	error( string.format("invalid unicode codepoint '%x'", n) )
end


local function parse_unicode_escape(s)
	local n1 = tonumber( s:sub(3, 6),  16 )
	local n2 = tonumber( s:sub(9, 12), 16 )
-- Surrogate pair?
	if n2 then
		return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
	else
		return codepoint_to_utf8(n1)
	end
end

YZZ_DES = "---------------\nBaidu OCR - PowerBy 游自在\n 飞天助手脚本学院 QQ研学群:905788670\n---------------"

local function parse_string(str, i)
	local has_unicode_escape = false
	local has_surrogate_escape = false
	local has_escape = false
	local last
	for j = i + 1, #str do
		local x = str:byte(j)

		if x < 32 then
			decode_error(str, j, "control character in string")
		end

		if last == 92 then -- "\\" (escape char)
			if x == 117 then -- "u" (unicode escape sequence)
				local hex = str:sub(j + 1, j + 5)
				if not hex:find("%x%x%x%x") then
					decode_error(str, j, "invalid unicode escape in string")
				end
				if hex:find("^[dD][89aAbB]") then
					has_surrogate_escape = true
				else
					has_unicode_escape = true
				end
			else
				local c = string.char(x)
				if not create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")[c] then
					decode_error(str, j, "invalid escape char '" .. c .. "' in string")
				end
				has_escape = true
			end
			last = nil

		elseif x == 34 then -- '"' (end of string)
			local s = str:sub(i + 1, j - 1)
			if has_surrogate_escape then
				s = s:gsub("\\u[dD][89aAbB]..\\u....", parse_unicode_escape)
			end
			if has_unicode_escape then
				s = s:gsub("\\u....", parse_unicode_escape)
			end
			if has_escape then
				s = s:gsub("\\.", escape_char_map_inv)
			end
			return s, j + 1

		else
			last = x
		end
	end
	decode_error(str, i, "expected closing quote for string")
end


local function parse_number(str, i)
	local x = next_char(str, i, create_set(" ", "\t", "\r", "\n", "]", "}", ","))
	local s = str:sub(i, x - 1)
	local n = tonumber(s)
	if not n then
		decode_error(str, i, "invalid number '" .. s .. "'")
	end
	return n, x
end


local function parse_literal(str, i)
	local x = next_char(str, i, create_set(" ", "\t", "\r", "\n", "]", "}", ","))
	local word = str:sub(i, x - 1)
	if not create_set("true", "false", "null")[word] then
		decode_error(str, i, "invalid literal '" .. word .. "'")
	end
	return literal_map[word], x
end


local function parse_array(str, i)
	local res = {}
	local n = 1
	i = i + 1
	while 1 do
		local x
		i = next_char(str, i, create_set(" ", "\t", "\r", "\n"), true)
		-- Empty / end of array?
		if str:sub(i, i) == "]" then
			i = i + 1
			break
		end
		-- Read token
		x, i = parse(str, i)
		res[n] = x
		n = n + 1
		-- Next token
		i = next_char(str, i, create_set(" ", "\t", "\r", "\n"), true)
		local chr = str:sub(i, i)
		i = i + 1
		if chr == "]" then break end
		if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
	end
	return res, i
end


local function parse_object(str, i)
	local res = {}
	i = i + 1
	while 1 do
		local key, val
		i = next_char(str, i, create_set(" ", "\t", "\r", "\n"), true)
		-- Empty / end of object?
		if str:sub(i, i) == "}" then
			i = i + 1
			break
		end
		-- Read key
		if str:sub(i, i) ~= '"' then
			decode_error(str, i, "expected string for key")
		end
		key, i = parse(str, i)
		-- Read ':' delimiter
		i = next_char(str, i, create_set(" ", "\t", "\r", "\n"), true)
		if str:sub(i, i) ~= ":" then
			decode_error(str, i, "expected ':' after key")
		end
		i = next_char(str, i + 1, create_set(" ", "\t", "\r", "\n"), true)
		-- Read value
		val, i = parse(str, i)
		-- Set
		res[key] = val
		-- Next token
		i = next_char(str, i, create_set(" ", "\t", "\r", "\n"), true)
		local chr = str:sub(i, i)
		i = i + 1
		if chr == "}" then break end
		if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
	end
	return res, i
end


local char_func_map = {
	[ '"' ] = parse_string,
	[ "0" ] = parse_number,
	[ "1" ] = parse_number,
	[ "2" ] = parse_number,
	[ "3" ] = parse_number,
	[ "4" ] = parse_number,
	[ "5" ] = parse_number,
	[ "6" ] = parse_number,
	[ "7" ] = parse_number,
	[ "8" ] = parse_number,
	[ "9" ] = parse_number,
	[ "-" ] = parse_number,
	[ "t" ] = parse_literal,
	[ "f" ] = parse_literal,
	[ "n" ] = parse_literal,
	[ "[" ] = parse_array,
	[ "{" ] = parse_object,
}


parse = function(str, idx)
	local chr = str:sub(idx, idx)
	local f = char_func_map[chr]
	if f then
		return f(str, idx)
	end
	decode_error(str, idx, "unexpected character '" .. chr .. "'")
end




--require("FreeSpace")

--local str = httpGet("http://127.0.0.1:8080/find?text=1234");
--local views = decodeView(str);
--for k,v in pairs(views) do
--	nLog("cid:"..v.cid);-- 控件cid 可以用于操控控件点击，长按，文本复制，文本输入等操作
--	nLog("x:"..v.rect.left);--x坐标
--	nLog("y:"..v.rect.top);--x坐标
--	nLog("文本:"..v.text);--控件内的文本
----	v:click();
--end

--views[2]:input("123466");

----str = httpGet("http://127.0.0.1:8080/cmd?a=click&id=7");

--nLog(str);


--local str = httpGet("http://127.0.0.1:8080/find?text=1234");

------------------------------------JSON END