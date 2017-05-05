require 'openssl'
require 'base64'

module Twook
  class CRC

    def initialize(key, token)
      @key = key
      @token = token
    end

    def response_token
      hash  = OpenSSL::HMAC.digest('sha256', @key, @token)
      Base64.encode64(hash).strip
    end
  end
end
