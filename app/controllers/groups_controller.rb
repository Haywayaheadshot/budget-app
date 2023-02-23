class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:notice] = 'Group created successfully.'
      redirect_to groups_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
