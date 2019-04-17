require "spec_helper"

RSpec.describe Bootpay do
  it 'Receipt Cancel' do
    bootpay = Bootpay::ServerApi.new(
      '59bfc738e13f337dbd6ca48a',
      'pDc0NwlkEX3aSaHTp/PPL/i8vn5E/CqRChgyEp/gHD0=',
      :development
    )
    result  = bootpay.get_access_token
    expect(result).not_to be_empty
    expect(result[:status]).to eq(200)

    result = bootpay.cancel(
      '5cb72c08e13f33668ddfe1e2',
      nil,
      nil,
      '테스트',
      '테스트'
    )
    print result
  end
end