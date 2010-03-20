class Person < ActiveRecord::Base
  has_many :time_entries, :foreign_key => :harvest_user_id, :primary_key => :harvest_user_id
end
