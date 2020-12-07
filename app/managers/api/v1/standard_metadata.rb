class Api::V1::StandardMetadata
  def call(query)
    {
      page: query.current_page,
      total_pages: query.total_pages,
      total_results: query.count,
      next_page: query.next_page,
      prev_page: query.previous_page
    }
  end
end

