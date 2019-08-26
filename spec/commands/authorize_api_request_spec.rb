require 'rails_helper'

describe 'authorize api request' do
    it 'authorizes an api request made by a user' do
        user = create(:user)
        command = AuthorizeApiRequest.call({'Authorization' => 'Bearer ' + JsonWebToken.encode(user.user_id)})
        
        expect(command).to be_success
        expect(command.result).to eq(user)
    end
end
