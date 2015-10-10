require 'rails_helper'

RSpec.describe "staffs/edit", :type => :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!(
      :project_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :role => "MyString"
    ))
  end

  it "renders the edit staff form" do
    render

    assert_select "form[action=?][method=?]", staff_path(@staff), "post" do

      assert_select "input#staff_project_id[name=?]", "staff[project_id]"

      assert_select "input#staff_first_name[name=?]", "staff[first_name]"

      assert_select "input#staff_last_name[name=?]", "staff[last_name]"

      assert_select "input#staff_email[name=?]", "staff[email]"

      assert_select "input#staff_phone[name=?]", "staff[phone]"

      assert_select "input#staff_role[name=?]", "staff[role]"
    end
  end
end
