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

describe 'enumerate_ips' do
  it 'returns 0 when passed "x.x.x.x/32"' do
    expect(enumerate_ips("x.x.x.x/32")).to eq("0")
  end
end