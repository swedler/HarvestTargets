class CreateGroupProjects < ActiveRecord::Migration
  def self.up
    create_table :group_projects do |t|
      t.integer :project_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :group_projects
  end
end
