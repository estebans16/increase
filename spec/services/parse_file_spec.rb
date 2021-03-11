require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Parse file' do
  before(:each) do
    file = File.open('./spec/support/fixtures/file.txt')
    @payments = ParseFile.new(file).process
  end

  it 'Success Payment' do
    payment = @payments.first

    expect(payment.external_payment_id).to eq('9985b3c3db2c42ffa481fa7daccacfdf')
    expect(payment.currency).to eq('ARS')
    expect(payment.total_amount).to eq(28_163_408)
    expect(payment.total_discount).to eq(852_628)
    expect(payment.total_with_discounts).to eq(27_310_780)
    expect(payment.payment_date).to eq(Date.iso8601('20201201'))
    expect(payment.client.external_client_id).to eq('aee603927f1a4a719a5f02656803c553')
  end

  it 'Succes payment transactions' do
    transactions = @payments.first.transactions
    first_transaction = transactions.detect { |tr| tr.external_transaction_id = '4d413a2fa47b41d0b33b51416dede498' }

    expect(transactions.size).to eq(21)
    expect(first_transaction.external_transaction_id).to eq('4d413a2fa47b41d0b33b51416dede498')
    expect(first_transaction.amount).to eq(9_619_142)
    expect(first_transaction.approved).to eq(false)
    expect(transactions.count(&:approved)).to eq(6)
    expect(transactions.count(&:disapproved)).to eq(15)
  end

  it 'Succes payment discounts' do
    discounts = @payments.first.discounts
    first_discount = discounts.first

    expect(discounts.size).to eq(1)
    expect(first_discount.external_discount_id).to eq('ab64b1b344fa4db18c3280547ade35ef')
    expect(first_discount.amount).to eq(852_628)
    expect(first_discount.discount_type).to eq('iva')
  end
end
# rubocop:enable Metrics/BlockLength