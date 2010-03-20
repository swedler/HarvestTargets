class Group < ActiveRecord::Base
  has_many :group_projects, :dependent => :destroy
  has_many :projects, :through => :group_projects
  
  def self.all_active
    Group.find(:all, :conditions => ["start_date >= ? AND end_date <= ?", Time.now.beginning_of_week, Time.now.end_of_week])
  end
  
end
