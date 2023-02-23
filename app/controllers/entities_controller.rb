class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities
  end

  def new
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new
    @group_id = params[:group_id]
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.new(entity_params)
    @group_entity = GroupEntity.new(group: @group, entity: @entity)

    if @entity.save && @group_entity.save
      # redirect to the group show page
      redirect_to group_path(@group), notice: "Entity created successfully."
    else
      # render the new entity form again with errors
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end

end
