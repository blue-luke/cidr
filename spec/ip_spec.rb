require './ip.rb'

describe 'decimal_to_binary' do 
  it 'converts a decimal ip to a binary ip' do 
    expect(decimal_to_binary("1.1.1.1")).to eq("00000001.0000001.00000001.00000001")
  end
end