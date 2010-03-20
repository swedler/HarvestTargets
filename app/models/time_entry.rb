class TimeEntry < ActiveRecord::Base
  belongs_to :person, :foreign_key => :harvest_user_id, :primary_key => :harvest_user_id
  
end
