class Api::V1::StandardPaginator
  PARAMS = ['page', 'per_page'].freeze
  def call(query:, params:)
    query = query.page(page_sanitized(params))
    query = query.per_page(per_page_sanitized(query, params)) if params[:per_page]
    query
  end

  private

  def page_sanitized(params)
    return if params[:page].blank?

    page = ::JSON.parse(params.fetch(:page))
    Integer(page, exception: false)
  end

  def per_page_sanitized(query, params)
    return query.total_entries if params[:per_page] == 'all'

    per_page = ::JSON.parse params.fetch(:per_page, nil)
    Integer(per_page, exception: false)
  end
end