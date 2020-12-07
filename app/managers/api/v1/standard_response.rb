class Api::V1::StandardResponse
  VALIDS_STATUS = %w[success warning error].freeze
  def call(
    status:,
    code: nil,
    message: nil,
    data: nil,
    metadata: nil
  )

    status_valid?(status)

    {
      status: status,
      code: code,
      message: message,
      data: data,
      metadata: metadata
    }.compact
  end

  private

  def status_valid?(status)
    raise(ArgumentError, "Unknown status #{status}.") if VALIDS_STATUS.exclude?(status)
  end
end