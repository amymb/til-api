require 'rails_helper'

describe 'json web token encode' do
  it 'encodes a payload using a webtoken' do
    expected_response = JWT.encode({
      :username => 'janet',
      :user_id => 1,
      :exp => 4
    }, Rails.application.secrets.secret_key_base)

    fake_payload = { :username => 'janet', :user_id => 1 }

    expect(JsonWebToken.encode(fake_payload, 4)).to eq(expected_response)
  end

  it 'decodes a token in response' do
    token = JWT.decode({
      :token => "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImphbmV0IiwidXNlcl9pZCI6MSwiZXhwIjo0fQ.akaACLZBQM6ukNC7CFm3wtTY7jnGkqjAxtT67QFko0g"
    }, Rails.application.secrets.secret_key_base )

    fake_token = { :token => "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImphbmV0IiwidXNlcl9pZCI6MSwiZXhwIjo0fQ.akaACLZBQM6ukNC7CFm3wtTY7jnGkqjAxtT67QFko0g" }

    expect(JsonWebToken.decode(fake_token)).to eq(token)
  end
end
