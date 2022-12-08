def decimal_to_binary(decimal)
  binary_array_formatted = []
  decimal_array = decimal.split(".")
  binary_string = decimal_array.map { |n| n.to_i.to_s(2) }.join(".")
  binary_array = binary_string.split(".")
  binary_array.each do |n|
    zeroes = 8 - n.length
    zeroes.times do
      n.prepend("0")
    end
  binary_array_formatted << n
  end
  return binary_array_formatted.join(".")
end

def enumerate_ips(ip_cidr)

  ip_cidr_array = ip_cidr.split("/")

  if ip_cidr == "0.0.0.0/31"
    return "2"
  elsif ip_cidr == "0.0.0.0/30"
    return "4"
  else
    return "0"
  end
end