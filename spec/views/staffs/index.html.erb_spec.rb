require 'rails_helper'

RSpec.describe "staffs/index", :type => :view do
  before(:each) do
    assign(:staffs, [
      Staff.create!(
        :project_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :role => "Role"
      ),
      Staff.create!(
        :project_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :role => "Role"
      )
    ])
  end

  it "renders a list of staffs" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
