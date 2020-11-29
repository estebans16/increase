class ParseFile
  def initialize(file)
    @file = file
    @payments = []
  end

  def process
    @file.each(sep="\n") do |line|
      process_line(line)
    end
    @payments
  end

  private

  def process_line(line)
    return head_line(line) if line.first == '1'
    return transaction_line(line) if line.first == '2'
    return discount_line(line) if line.first == '3'

    footer_line(line)
  end

  def head_line(line)
    @payment = Payment.new
    @payment.id = line[1..32]
    @payment.currency = line[36..38] == '000' ? 'ARS' : 'USD'
    @payment.total_amount = line[39..51].to_f
    @payment.total_discount = line[52..64].to_f
    @payment.total_with_discounts = line[65..77].to_f
  end

  def transaction_line(line)
    transaction = Transaction.new
    transaction.id = line[1..32]
    transaction.amount = line[33..45]
    transaction.approved = line[51] == '1'
    @payment.transactions << transaction
  end

  def discount_line(line)
    discount = Discount.new
    discount.id = line[1..32]
    discount.amount = line[33..45]
    discount.discount_type = line[49].to_i
    @payment.discounts << discount
  end

  def footer_line(line)
    @payment.payment_date = Date.iso8601(line[16..23])
    @payment.client = Client.new(id: line[24..55])
    @payments << @payment
  end
end
