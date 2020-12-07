class Api::V1::Clients::Payments

  def call(params)
    query = Payment.joins(:client).where("clients.external_client_id": params[:external_client_id])
    query = Api::V1::StandardPaginator.new.call(query: query, params: params)
    construct(query)
  end

  private

  def construct(query)
    data = data(query)
    metadata = Api::V1::StandardMetadata.new.call(query)
    Api::V1::StandardResponse.new.call(
      status: 'success',
      data: data,
      metadata: metadata,
      code: 200
    )
  end

  def data(results)
    results
  end
end
