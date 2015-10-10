require 'rails_helper'

RSpec.describe "budget_items/edit", :type => :view do
  before(:each) do
    @budget_item = assign(:budget_item, BudgetItem.create!(
      :project_id => 1,
      :development_metres => 1,
      :rehab_metres => 1
    ))
  end

  it "renders the edit budget_item form" do
    render

    assert_select "form[action=?][method=?]", budget_item_path(@budget_item), "post" do

      assert_select "input#budget_item_project_id[name=?]", "budget_item[project_id]"

      assert_select "input#budget_item_development_metres[name=?]", "budget_item[development_metres]"

      assert_select "input#budget_item_rehab_metres[name=?]", "budget_item[rehab_metres]"
    end
  end
end
