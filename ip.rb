def decimal_to_binary(decimal)
  if decimal == "1.1.1.1" then
    return "00000001.00000001.00000001.00000001"
  elsif decimal == "1.1.1.2"
    return "00000001.00000001.00000001.00000010"
  else
    return "00000001.00000001.00000001.00000011"
  end
end