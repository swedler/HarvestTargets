class AddEntryIdToTimeEntries < ActiveRecord::Migration
  def self.up
    add_column :time_entries, :harvest_entry_id, :integer
  end

  def self.down
    remove_column :time_entries, :harvest_entry_id
  end
end
