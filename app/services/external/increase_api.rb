# External services
module External
  # Client for Increase API
  module IncreaseApi
    ResponseClient = Struct.new(:status, :body)
    ResponseFile = Struct.new(:status, :file)

    @connection = Faraday.new(
      url: ENV['CLIENT_API_HOST'],
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{ENV['API_TOKEN']}"
      }
    )

    def self.client(id)
      res = @connection.get("clients/#{id}")
      ResponseClient.new(res.status, JSON.parse(res.body))
    rescue Faraday::ConnectionFailed
      ResponseClient.new(500)
    end

    def self.file
      res = @connection.get('file.txt', { 'Content-Type': 'text/plain; charset=UTF-8' })
      temp = Tempfile.create('api_file', './tmp')
      temp.write(res.body)
      temp.rewind
      ResponseFile.new(res.status, temp)
    rescue Faraday::ConnectionFailed
      ResponseClient.new(500)
    end
  end
end
