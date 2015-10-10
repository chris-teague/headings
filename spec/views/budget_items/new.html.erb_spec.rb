require 'rails_helper'

RSpec.describe "budget_items/new", :type => :view do
  before(:each) do
    assign(:budget_item, BudgetItem.new(
      :project_id => 1,
      :development_metres => 1,
      :rehab_metres => 1
    ))
  end

  it "renders new budget_item form" do
    render

    assert_select "form[action=?][method=?]", budget_items_path, "post" do

      assert_select "input#budget_item_project_id[name=?]", "budget_item[project_id]"

      assert_select "input#budget_item_development_metres[name=?]", "budget_item[development_metres]"

      assert_select "input#budget_item_rehab_metres[name=?]", "budget_item[rehab_metres]"
    end
  end
end
