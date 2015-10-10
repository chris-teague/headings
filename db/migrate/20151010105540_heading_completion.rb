class HeadingCompletion < ActiveRecord::Migration
  def change
    add_column :headings, :completion, :integer, default: 0
  end
end
