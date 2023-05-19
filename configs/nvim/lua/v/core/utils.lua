local Utils = {}

function Utils.merge_tables(a, b)
  local result = a
  for k, v in pairs(b) do
    result[k] = v
  end
  return result
end

return Utils
