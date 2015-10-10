class CreateHeadings < ActiveRecord::Migration
  def change
    create_table :headings do |t|
      t.integer :project_id
      t.string :name
      t.string :status
      t.decimal :lat,         precision: 15, scale: 10
      t.decimal :lng,         precision: 15, scale: 10

      t.timestamps null: false
    end
  end
end
