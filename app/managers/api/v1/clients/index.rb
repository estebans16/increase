class Api::V1::Clients::Index
  FIELDS = Client::PARAMS
  def call(params)
    query = Client.all
    query = Api::V1::StandardSelect.new.call(query: query, params: params, attribute_names: FIELDS)
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