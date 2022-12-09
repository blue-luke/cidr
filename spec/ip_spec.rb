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
  it 'returns 0 when passed "0.0.0.0/32"' do
    expect(enumerate_ips("0.0.0.0/32")).to eq("1")
  end
  it 'returns 2 when passed "0.0.0.0/31"' do
    expect(enumerate_ips("0.0.0.0/31")).to eq("2")
  end
  it 'returns 4 when passed "0.0.0.0/30"' do
    expect(enumerate_ips("0.0.0.0/30")).to eq("4")
  end
end

describe 'enumerate_ips in other octets, simple' do
  it 'returns 256 when passed "0.0.0.0/24"' do
    expect(enumerate_ips("0.0.0.0/24")).to eq("256")
  end
  it 'returns 2 when passed "0.0.0.0/16"' do
    expect(enumerate_ips("0.0.0.0/16")).to eq("65536")
  end
  it 'returns 4 when passed "0.0.0.0/8"' do
    expect(enumerate_ips("0.0.0.0/8")).to eq("16777216")
  end
end