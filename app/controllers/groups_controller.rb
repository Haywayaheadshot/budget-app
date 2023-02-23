class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = 'Group created successfully.'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'Unable to create group.'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
