require 'rails_helper'

describe 'authenticate user' do
  it 'returns an encoded user_id when a user with valid credentials is submitted' do
    user = create(:user)
    command = AuthenticateUser.call(user.email, user.password)

    expect(command).to be_success
    expect(JsonWebToken.decode(command.result)['user_id']).to eq(user.id)
  end
end
