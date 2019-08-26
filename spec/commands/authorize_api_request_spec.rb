require 'rails_helper'

describe 'authorize api request' do
    it 'authorizes an api request made by a user' do
        user = create(:user)
        command = AuthorizeApiRequest.call({'Authorization' => 'Bearer ' + JsonWebToken.encode({:user_id => user.id})
        })

        expect(command).to be_success
        expect(command.result).to eq(user)
    end

    it 'returns error message if invalid token' do
        command = AuthorizeApiRequest.call({'Authorization' => 'Bearer ' + JsonWebToken.encode({:user_id => 12 })})
        
        expect(command).to_not be_success
        expect(command.result).to eq(nil)
        expect(command.errors[:token][0]).to eq('Invalid token')
    end

    it 'returns error message if missing token' do
        command = AuthorizeApiRequest.call({'Hello' => 'Bearer ' + JsonWebToken.encode({:user_id => 12})
        })

        expect(command).to_not be_success
        expect(command.result).to eq(nil)
        expect(command.errors[:token][0]).to eq('Missing token')
    end
end
