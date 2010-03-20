class GroupsController < ApplicationController
  def new
    @projects = Project.find(:all, :conditions => ["updated_at >= ?", Time.now.beginning_of_week])
    @group = Group.new
  end
  
  def create
    @group = Group.create(params[:group])
    redirect_to group_path(@group)
  end
  
  def edit
    @group = Group.find(params[:id])
    @projects = Project.find(:all, :conditions => ["updated_at >= ?", Time.now.beginning_of_week])
  end

  def update
    @group = Group.find(params[:id])
    @group.update_attributes(params[:group])
    redirect_to group_path(@group)
  end
  
  def show
    @group = Group.find(params[:id])
    @projects = @group.projects.all
  end
  
end
