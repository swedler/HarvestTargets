class Project < ActiveRecord::Base
  has_many :time_entries, :foreign_key => :harvest_project_id, :primary_key => :harvest_id
  has_many :people, :through => :time_entries
  has_many :group_projects, :dependent => :destroy
  has_many :groups, :through => :group_projects
end
