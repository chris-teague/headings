require 'rails_helper'

RSpec.describe "BudgetItems", :type => :request do
  describe "GET /budget_items" do
    it "works! (now write some real specs)" do
      get budget_items_path
      expect(response.status).to be(200)
    end
  end
end
