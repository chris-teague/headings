class ProjectStatus < ActiveRecord::Migration
  def change
    add_column :projects, :budget_status, :integer, default: 100
  end
end
