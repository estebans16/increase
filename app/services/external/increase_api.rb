# External services
module External
  # Client for Increase API
  module IncreaseApi
    Response = Struct.new(:status, :body)

    @connection = Faraday.new(
      url: ENV['CLIENT_API_HOST'],
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{ENV['API_TOKEN']}"
      }
    )

    def self.client(id)
      res = @connection.get("clients/#{id}")
      Response.new(res.status, JSON.parse(res.body))
    end

    def self.file
      res = @connection.get('file.txt')
      Response.new(res.status, JSON.parse(res.body))
    end
  end
end
