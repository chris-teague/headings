class HeadingsParents < ActiveRecord::Migration
  def change
    add_column :headings, :parent_name, :string
  end
end
