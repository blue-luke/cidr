require './ip.rb'

describe 'decimal_to_binary' do 
  it 'converts a "1.1.1.1" to "00000001.00000001.00000001.00000001"' do 
    expect(decimal_to_binary("1.1.1.1")).to eq("00000001.00000001.00000001.00000001")
  end
  it 'converts a "1.1.1.2" to "00000001.00000001.00000001.00000010"' do 
    expect(decimal_to_binary("1.1.1.2")).to eq("00000001.00000001.00000001.00000010")
  end
end