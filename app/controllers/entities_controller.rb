class EntitiesController < ApplicationController
  def index
    @group = Group.where(user_id: current_user.id)
    @entities = GroupEntity.where(group_id: params[:group_id])
    @total = 0
    @entities.each do |t|
      @total += t.entity.amount
    end
  end

  def new
    @groups = Group.where(user_id: current_user.id)
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new
    @group_id = params[:group_id]
  end

  def create
    @entity = Entity.new(entity_params.except(:group_id))
    @entity.user_id = current_user.id

    if @entity.save
      entity_params[:group_id].each do |group|
        @group_entity = GroupEntity.new(group_id: group, entity_id: @entity.id)
        @group_entity.save
      end
      redirect_to groups_path, notice: 'Entity created successfully.'
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, group_id: [])
  end
end
