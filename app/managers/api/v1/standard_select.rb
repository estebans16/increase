class Api::V1::StandardSelect
  def call(query:, params:, attribute_names:)
    if params[:fields]
      valid_fields = attribute_names & params[:fields].split(',').map(&:to_sym)
      query = query.select(valid_fields) if valid_fields.any?
    end
    query
  end
end