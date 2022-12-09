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

  print ip_cidr_array = ip_cidr.split("/")
  ip_as_string = decimal_to_binary(ip_cidr_array[0]).tr('.','')

  network_bits = ip_cidr_array[1]

  host_bits = ip_as_string[network_bits.to_i..-1]
  binary_places = host_bits.length
  (2 ** binary_places).to_s

end