# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#  session_token   :string           not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  # subject(:user) do
  #   FactoryBot.build(:user,
  #     username: 'Chris',
  #     password: '123456'
  #   )
  # end

  user = User.create(username: 'Chris', password: 'starwars')

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}

#   before(:each) {  user = User.create(username: 'Chris', password: 'starwars')
# }
#   it {should validate_uniqueness_of(:username)}
#   it {should validate_uniqueness_of(:session_token)}

  it {should validate_length_of(:password).is_at_least(6)}

  it {should have_many(:goals)}
  # it {should have_many(:comments)}

  it 'User::find_by_credentials to return correct user' do
    user = User.create(username: 'Christopher', password: 'starwars')
    expect(User.find_by_credentials('Christopher', 'starwars')).to eq(user)
  end

  it 'ensure_session_token is not nil' do
    user = User.create(username: 'Christopher', password: 'starwars')
    expect(user.session_token).to_not be_nil
  end

  it 'reset_session_token' do
    user = User.create(username: 'Christopher', password: 'starwars')
    old_session_token = user.session_token
    user.reset_session_token!
    expect(user.session_token).to_not eq(old_session_token)
  end


end
