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

  it 'sends one nugget by id' do
    create(:user, id: 1)
    id = create(:nugget).id

    get "/api/v1/nuggets/#{id}"

    expect(response).to be_successful

    nugget = JSON.parse(response.body)

    expect(nugget["id"]).to eq(id)
  end

  it 'creates a new nugget' do
    id = create(:user, id: 1).id
    nugget_params = { title: "This is a title", description: "This is a description", external_link: "http://www.testsandmoretests.com", user_id: id }

    post "/api/v1/nuggets", params: {nugget: nugget_params}
    nugget = Nugget.last

    expect(response).to be_successful
    expect(nugget.title).to eq(nugget_params[:title])
    expect(nugget.description).to eq(nugget_params[:description])
    expect(nugget.external_link).to eq(nugget_params[:external_link])
    expect(nugget.user_id).to eq(nugget_params[:user_id])
  end

  it 'updates an existing nugget' do
    create(:user, id: 1)
    id = create(:nugget).id
    previous_title = Nugget.last.title
    nugget_params = { title: "Now, this is the updated title!!"}

    put "/api/v1/nuggets/#{id}", params: {nugget: nugget_params}
    nugget = Nugget.find_by(id: id)

    expect(response).to be_successful
    expect(nugget.title).to_not eq(previous_title)
    expect(nugget.title).to eq(nugget_params[:title])
  end

  it 'destroys an nugget' do
    create(:user, id: 1)
    id = create(:nugget).id

    expect{ delete "/api/v1/nuggets/#{id}" }.to change(Nugget, :count).by(-1)

    expect(response).to be_successful
    expect{Nugget.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
