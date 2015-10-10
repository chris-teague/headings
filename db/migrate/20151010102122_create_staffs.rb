class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.integer :project_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :role

      t.timestamps null: false
    end
  end
end
