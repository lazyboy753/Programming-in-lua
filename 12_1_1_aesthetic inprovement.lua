

function oneIndentEscape(str, strToDel)
	local s, e = string.find(str, strToDel)

	--return string.sub(str, string.find(str, strDtDel))

	return string.sub(str, 0, s-1) .. string.sub(str, e+1)
end

function serialize (o, indentation)
  if type(o, indentation) == "number" then
	io.write(o)
  elseif type(o, indentation) == "string" then
	io.write(string.format("%q", o))
  elseif type(o, indentation) == "table" then
	io.write("{\n")
	for k,v in pairs(o) do
	  io.write(indentation, k, " = ")
	  local indentPlus = ""
	  if(type(v) == "table") then
		--print("type v == table")
		indentPlus = "  "
	  end
	  serialize(v, indentation .. indentPlus, i)
	  io.write(",\n")
	end
	--to do indentaiton - "  "
	--[[
	通过找出"  "，然后在从indentation里面删除这个串
	]]--
	indentation = oneIndentEscape(indentation, "  ")
	io.write(indentation, "}") -- to be continue 这里要看api怎么操作字符串减去多余的空格
									--用这个方法print(string.gsub(str, "dd", "--"))
  else
	error("cannot serialize a " .. type(o))
  end

end


local a = {a = "abc",
		   b = {"x", "y"},
		   c = "hij"}

function aestheticSerialize(a)
	serialize(a, "  ")
end


aestheticSerialize(a)
