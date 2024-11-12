module ApiResponse
  def self.ok(data: nil, message: nil)
    { code: 0, message: message, data: data }
  end

  def self.err(code: -1, message: 'err', data: nil)
    { code: code, message: message, data: data }
  end
end