require 'rails_helper'

describe 'users api' do
  it 'sends a list of users' do
    create_list(:user, 3)

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(response.body)

    expect(users.count).to eq(3)
  end

  it 'sends one user by id' do
    id = create(:user).id

    get "/api/v1/users/#{id}"

    expect(response).to be_successful

    user = JSON.parse(response.body)

    expect(user["id"]).to eq(id)
  end

  it 'creates a new user' do
    user_params = { first_name: "Jane", last_name: "Smith", username: "janesmith77", email: "jsmith@email.com", admin: false, password: "EoC9ShWd1Vg5mSvY1UeRg7" }

    post "/api/v1/users", params: {user: user_params}
    user = User.last

    expect(response).to be_successful
    expect(user.first_name).to eq(user_params[:first_name])
    expect(user.last_name).to eq(user_params[:last_name])
  end

  it 'updates an existing user' do
    id = create(:user).id
    previous_last_name = User.last.last_name
    user_params = { last_name: "Jones"}

    put "/api/v1/users/#{id}", params: {user: user_params}
    user = User.find_by(id: id)

    expect(response).to be_successful
    expect(user.last_name).to_not eq(previous_last_name)
    expect(user.last_name).to eq(user_params[:last_name])
  end

  it 'destroys an user' do
    user = create(:user)

    expect{ delete "/api/v1/users/#{user.id}" }.to change(User, :count).by(-1)

    expect(response).to be_successful
    expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
