require 'rails_helper'

describe 'json web token encode' do
  it 'encodes a payload using a webtoken' do
    expected_response = JWT.encode({
      :username => 'janet',
      :user_id => 1,
      :exp => 4
    }, Rails.application.credentials.secret_key_base)

    fake_payload = { :username => 'janet', :user_id => 1 }

    expect(JsonWebToken.encode(fake_payload, 4)).to eq(expected_response)
  end

  it 'decodes a token in response' do
    token = JWT.encode({
      :username => 'janet',
      :user_id => 1
    }, Rails.application.credentials.secret_key_base)

    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]

    expect(JsonWebToken.decode(token)).to eq(decoded_token)
  end
end
