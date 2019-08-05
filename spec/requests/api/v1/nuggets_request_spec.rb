require 'rails_helper'

describe 'nuggets api' do
  it 'sends a list of nuggets' do
    create(:user, id: 1)
    create_list(:nugget, 3)
    get '/api/v1/nuggets'
    expect(response).to be_successful

    nuggets = JSON.parse(response.body)

    expect(nuggets.count).to eq(3)
  end
end
