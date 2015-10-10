class AddLatLngToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :lat, :decimal, precision: 15, scale: 10, default: nil
    add_column :projects, :lng, :decimal, precision: 15, scale: 10, default: nil
  end
end
