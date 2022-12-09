require './ip.rb'

describe 'decimal_to_binary' do 
  it 'converts a "1.1.1.1" to "00000001.00000001.00000001.00000001"' do 
    expect(decimal_to_binary("1.1.1.1")).to eq("00000001.00000001.00000001.00000001")
  end
  it 'converts a "1.1.1.2" to "00000001.00000001.00000001.00000010"' do 
    expect(decimal_to_binary("1.1.1.2")).to eq("00000001.00000001.00000001.00000010")
  end
  it 'converts a "1.1.1.3" to "00000001.00000001.00000001.00000011"' do 
    expect(decimal_to_binary("1.1.1.3")).to eq("00000001.00000001.00000001.00000011")
  end
end

describe 'enumerate_ips in 4th octet' do
  it 'returns 1 when passed "0.0.0.0/32"' do
    expect(enumerate_ips("0.0.0.0/32")).to eq("1")
  end
  it 'returns 2 when passed "0.0.0.0/31"' do
    expect(enumerate_ips("0.0.0.0/31")).to eq("2")
  end
  it 'returns 4 when passed "0.0.0.0/30"' do
    expect(enumerate_ips("0.0.0.0/30")).to eq("4")
  end
end

describe 'enumerate_ips in other octets, simple ip simple cidr' do
  it 'returns 256 when passed "0.0.0.0/24"' do
    expect(enumerate_ips("0.0.0.0/24")).to eq("256")
  end
  it 'returns 65536 when passed "0.0.0.0/16"' do
    expect(enumerate_ips("0.0.0.0/16")).to eq("65536")
  end
  it 'returns 16777216 when passed "0.0.0.0/8"' do
    expect(enumerate_ips("0.0.0.0/8")).to eq("16777216")
  end
end

describe 'enumerate_ips in other octets, private ipv4 addresses' do
  it 'returns 16777216 when passed "10.0.0.0/8"' do
    expect(enumerate_ips("10.0.0.0/8")).to eq("16777216")
  end
  it 'returns 1048576 when passed "172.16.0.0/12"' do
    expect(enumerate_ips("172.16.0.0/12")).to eq("1048576")
  end
  it 'returns 65536 when passed "192.168.0.0/16"' do
    expect(enumerate_ips("192.168.0.0/16")).to eq("65536")
  end
  it 'returns 65536 when passed "127.0.0.0/8"' do
    expect(enumerate_ips("127.0.0.0/8")).to eq("16777216")
  end
end

describe 'enumerate_ips in other octets, complex' do
  it 'returns 32 when passed "0.0.0.0/27"' do
    expect(enumerate_ips("0.0.0.0/27")).to eq("32")
  end
  it 'returns 256 when passed "200.100.10.0/24"' do
    expect(enumerate_ips("200.100.10.0/24")).to eq("256")
  end
  it 'returns 128 when passed "200.100.10.0/25"' do
    expect(enumerate_ips("200.100.10.0/25")).to eq("128")
  end
  it 'returns 128 when passed "200.100.10.128/25"' do
    expect(enumerate_ips("200.100.10.128/25")).to eq("128")
  end
end

describe 'calculates lower range of ips' do
  it 'returns "Lower bound is 0.0.0.0" when passed "0.0.0.0/24"' do
    expect(find_lower_bound("0.0.0.0/24")).to eq("0.0.0.0")
  end
  it 'returns "Lower bound is 0.0.1.0" when passed "0.0.1.0/24"' do
    expect(find_lower_bound("0.0.1.0/24")).to eq("0.0.1.0")
  end
  it 'returns "Lower bound is 0.0.0.0" when passed "0.0.1.0/8"' do
    expect(find_lower_bound("0.0.1.0/8")).to eq("0.0.0.0")
  end
end

describe 'calculates upper range of ips' do
  it 'returns "Upper bound is 0.0.0.255" when passed "0.0.0.0/24"' do
    expect(find_upper_bound("0.0.0.0/24")).to eq("0.0.0.255")
  end
  it 'returns "Upper bound is 0.0.1.255" when passed "0.0.1.0/24"' do
    expect(find_upper_bound("0.0.1.0/24")).to eq("0.0.1.255")
  end
  it 'returns "Uper bound is 0.255.255.255" when passed "0.0.1.0/8"' do
    expect(find_upper_bound("0.0.1.0/8")).to eq("0.255.255.255")
  end
end

describe 'binary_to_decimal' do
  it 'converts a "00000001.00000001.00000001.00000001" to "1.1.1.1"' do 
    expect(binary_to_decimal("00000001.00000001.00000001.00000001")).to eq("1.1.1.1")
  end
  it 'converts a "00000001.00000001.00000001.00000010" to "1.1.1.2"' do 
    expect(binary_to_decimal("00000001.00000001.00000001.00000010")).to eq("1.1.1.2")
  end
  it 'converts a "00000001.00000001.00000001.00000011" to "1.1.1.3"' do 
    expect(binary_to_decimal("00000001.00000001.00000001.00000011")).to eq("1.1.1.3")
  end
end
