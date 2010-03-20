class AddTaskIdToTimeEntries < ActiveRecord::Migration
  def self.up
    add_column :time_entries, :harvest_task_id, :integer
  end

  def self.down
    remove_column :time_entries, :harvest_task_id
  end
end
