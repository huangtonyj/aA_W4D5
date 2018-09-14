require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'Get #index' do
    it 'displays all user' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'Get #show' do
    it 'display a user' do
      user = User.create(username: 'Christopher', password: 'starwars')
      get :show, params: {id: user.id}
      expect(response).to render_template(:show)
    end
  end

  describe 'Get #new' do
    it 'displays signup page' do
      get :new
      expect(response).to render_template(:new)
    end
  end


  describe 'post #create' do
    it 'creates a new user' do
      post :create, params: {user: { username: 'Christopher', password: 'starwars'} }
      user = User.find_by(username: 'Christopher')

      expect(response).to redirect_to(user_url(user))
    end
  end

end
