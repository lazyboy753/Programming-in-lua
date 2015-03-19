
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

	indentation = string.gsub(indentation, "  ", "", 1)
	io.write(indentation, "}")
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
