class ProjectsController < ApplicationController
  before_filter :open_harvest_connection

  def index
    @projects = Project.find(:all, :conditions => ["updated_at >= ?", Time.now.beginning_of_week])
  end
  
end
