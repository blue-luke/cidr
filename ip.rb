def decimal_to_binary(decimal)

  # Convert each decimal number to binary
  decimal_array = decimal.split(".")
  binary_string = decimal_array.map { |n| n.to_i.to_s(2) }.join(".")

  # Prepare arrays to read from and write to in next step
  binary_array = binary_string.split(".")
  binary_array_formatted = []

  # Add 0s to the beginning so each binary number is 8 bits long
  binary_array.each do |n|

    zeroes = 8 - n.length
    zeroes.times do
      n.prepend("0")
    end

  binary_array_formatted << n

  end

  return binary_array_formatted.join(".")

end

def binary_to_decimal(binary)

  # Convert each decimal number to binary
  binary_array = binary.split(".")
  decimal_string = binary_array.map { |n| n.to_i(2).to_s }.join(".")

end


def enumerate_ips(ip_cidr)

  # Split the ip and cidr into an array of two parts 
  ip_cidr_array = ip_cidr.split("/")

  # Turn the decimal ip into a binary ip using function above, removing dots
  ip_as_string = decimal_to_binary(ip_cidr_array[0]).tr('.','')

  # Separate the network bits from the host bits
  network_bits = ip_cidr_array[1]
  host_bits = ip_as_string[network_bits.to_i..-1]

  # Total addresses are number of permutations of host bits
  binary_places = host_bits.length
  (2 ** binary_places).to_s

end

def find_boundary_condition(ip_cidr, upper_or_lower)
  ip_cidr_array = ip_cidr.split("/")
  ip_as_string = decimal_to_binary(ip_cidr_array[0]).tr('.','')
  network_bits = ip_cidr_array[1]
  network_address_binary = ip_as_string[0...network_bits.to_i]
  zeroes = (32 - network_address_binary.length)
  zeroes.times do
    network_address_binary << (upper_or_lower)
  end
  network_address_binary_formatted = network_address_binary.scan(/.{8}|.+/).join(".")
  binary_to_decimal(network_address_binary_formatted)
end

def find_lower_bound(ip_cidr)
  find_boundary_condition(ip_cidr, "0")
end

def find_upper_bound(ip_cidr)
  find_boundary_condition(ip_cidr, "1")
end

def explain_ip(ip_cidr)
    print "Lower bound of ip range is " + find_lower_bound(ip_cidr) + "\n"
    print "Upper bound of ip range is " + find_upper_bound(ip_cidr) + "\n"
    print "Number of ips available is " + enumerate_ips(ip_cidr)
end