require 'rails_helper'

RSpec.describe "budget_items/show", :type => :view do
  before(:each) do
    @budget_item = assign(:budget_item, BudgetItem.create!(
      :project_id => 1,
      :development_metres => 2,
      :rehab_metres => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
