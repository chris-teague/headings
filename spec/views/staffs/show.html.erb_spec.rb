require 'rails_helper'

RSpec.describe "staffs/show", :type => :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!(
      :project_id => 1,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Role/)
  end
end
