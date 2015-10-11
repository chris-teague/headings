class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :project_id
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.datetime :last_serviced_at
      t.datetime :next_scheduled_service
      t.string :status

      t.timestamps null: false
    end
  end
end
