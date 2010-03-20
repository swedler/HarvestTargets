class CreateTimeEntries < ActiveRecord::Migration
  def self.up
    create_table :time_entries do |t|
      t.integer :harvest_project_id
      t.integer :harvest_user_id
      t.datetime :date
      t.float :hours

      t.timestamps
    end
  end

  def self.down
    drop_table :time_entries
  end
end
