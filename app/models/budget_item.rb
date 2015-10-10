class BudgetItem < ActiveRecord::Base
  belongs_to :project
  validates :date, uniqueness: { scope: :project_id }
  validates :date, presence: true

  def to_s
    "#{date}"
  end
end
