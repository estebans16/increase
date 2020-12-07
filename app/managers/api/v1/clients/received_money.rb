class Api::V1::Clients::ReceivedMoney
  def call(params)
    query = Payment.joins(:client)
                   .where('clients.external_client_id = ? AND payment_date <= ?',
                          params[:external_client_id], DateTime.now)
    result = { external_client_id: params[:external_client_id] }
    result.merge!(total_by_currency(query, 'ARS'))
    result.merge!(total_by_currency(query, 'USD'))
  end

  private

  def total_by_currency(query, currency)
    by_currency = query.select { |pay| pay.currency == currency }
    {
      "#{currency}": {
        total_amount: by_currency.sum(&:total_amount),
        total_discount: by_currency.sum(&:total_discount),
        total_with_discounts: by_currency.sum(&:total_with_discounts)
      }
    }
  end
end
