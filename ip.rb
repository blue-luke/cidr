def decimal_to_binary(decimal)
  array = decimal.split(".")
  return array.map { |n| n.to_i.to_s(2) }.join(".")
end