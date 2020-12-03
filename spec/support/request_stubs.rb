# Stubs api request
module RequestStubs
  # def call
    # client
  # end
  # module_function

  def self.client
    WebMock.stub_request(:get, "#{ENV['CLIENT_API_HOST']}/clients/aee603927f1a4a719a5f02656803c553")
      .with(
        headers: {
          'Authorization': 'Bearer',
          'Content-Type': 'application/json'
        }
      ).to_return(status: 200, body: read_json('client'), headers: {})
  end

  private

  def self.read_json(name)
    File.read(File.join('spec', 'support', 'fixtures', "#{name}.json"))
  end
end
