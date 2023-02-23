require 'rails_helper'

RSpec.describe Entity, type: :model do
    before do
        @user = User.create(email: 'test1@mail.com', name: 'nameTest1', password: '112233', password_confirmation: '112233')
        @entity_one = Entity.create(name: "macDonalds", amount: 20, user_id: @user.id)
        @entity_one.save
      end
    
      it 'name should be present' do
        expect(@entity_one.name).to_enum ("macDonalds")
      end
    
      it 'amount should be present' do
        expect(@entity_one.amount).to eql 20
      end
    
      it 'amount should be a valid decimal' do
        @entity_one.amount = 3.1
        expect(@entity_one).to be_valid
      end

      it 'entity should belong to user' do
        expect(@entity_one.user.name).to_enum ("nameTest1")
      end
end
