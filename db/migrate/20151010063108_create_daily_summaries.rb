class CreateDailySummaries < ActiveRecord::Migration
  def change
    create_table :daily_summaries do |t|
      t.integer :project_id
      t.date :date
      t.decimal :actual_advance_metres,     precision: 15, scale: 4
      t.decimal :actual_rehab_metres,       precision: 15, scale: 4
      t.decimal :actual_available_headings, precision: 15, scale: 4
      t.decimal :daily_advance_metres,      precision: 15, scale: 4
      t.decimal :daily_rehab_metres,        precision: 15, scale: 4
      t.decimal :daily_active_headings,     precision: 15, scale: 4
      t.decimal :daily_available_headings,  precision: 15, scale: 4

      t.timestamps null: false
    end
  end
end
