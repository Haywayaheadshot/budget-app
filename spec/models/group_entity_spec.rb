require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
    before do
        @user = User.create(email: 'test1@mail.com', name: 'nameTest1', password: '112233', password_confirmation: '112233')
        @group_one = Group.create(name: "Holiday", user_id: @user.id)
        @entity_one = Entity.create(name: "macDonalds", amount: 45, user_id: @user.id)
        @group_entity = GroupEntity.create(entity_id: @entity_one.id, group_id: @group_one.id)
        @group_entity.save
      end
    
      it 'entity name should be present' do
        expect(@group_entity.entity.name).to_enum ("macDonalds")
      end
    
      it 'entity amount should be present' do
        expect(@group_entity.entity.amount).to eql 45
      end

      it 'entity should belong to user' do
        expect(@group_entity.entity.user.name).to_enum ("nameTest1")
      end

      it 'group name should be present' do
        expect(@group_entity.group.name).to_enum ("Holiday")
      end

      it 'group should belong to user' do
        expect(@group_entity.group.user.email).to_enum ("nameTest1")
      end
end
