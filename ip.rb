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
