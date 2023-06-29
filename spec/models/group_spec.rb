require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(email: 'test1@mail.com', name: 'nameTest1', password: '112233', password_confirmation: '112233')
    @group_one = Group.create(name: 'Holiday', user_id: @user.id)
  end

  it 'name should be present' do
    @group_one.name = nil
    expect(@group_one).to_not be_valid
  end

  it 'icon should be nil' do
    @group_one.icon = nil
    expect(@group_one).to be_valid
  end

  it 'should have a valid user' do
    expect(@group_one.user).to eq(@user)
  end

  it 'should belong to a user' do
    expect(@user.groups).to include(@group_one)
  end
end
