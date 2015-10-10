class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.date :date
      t.integer :project_id
      t.integer :development_metres
      t.integer :rehab_metres

      t.timestamps null: false
    end
  end
end
