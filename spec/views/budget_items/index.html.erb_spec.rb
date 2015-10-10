require 'rails_helper'

RSpec.describe "budget_items/index", :type => :view do
  before(:each) do
    assign(:budget_items, [
      BudgetItem.create!(
        :project_id => 1,
        :development_metres => 2,
        :rehab_metres => 3
      ),
      BudgetItem.create!(
        :project_id => 1,
        :development_metres => 2,
        :rehab_metres => 3
      )
    ])
  end

  it "renders a list of budget_items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
