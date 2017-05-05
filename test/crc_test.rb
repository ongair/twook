require 'test_helper'
require 'openssl'
require 'base64'


class TwookTest < Minitest::Test
  def test_that_it_can_compute_the_correct_test
    key = "1234567890"
    crc_token = "0987654321"

    hash  = OpenSSL::HMAC.digest('sha256', key, crc_token)
    token = Base64.encode64(hash).strip

    crc = Twook::CRC.new(key,crc_token)
    assert_equal token, crc.response_token
  end
end
