class Project < ActiveRecord::Base

  paginates_per 18

  acts_as_url :name

  validates :name, presence: true, uniqueness: :true

  has_many :budget_items
  has_many :daily_summaries

  def to_param
    url
  end

  def sorted_budget_items
    create_missing_budget_items
  end

  def sorted_progress_data
    daily_summaries.sort_by(&:date)
  end

  private

    def create_missing_budget_items
      count = 0
      results = []
      ((Date.today-1.month)..(Date.today+24.months)).select { |d| d.day == 1 }.collect do |date|
        if date.month == 7 && count > 2
          break
        else
          count += 1
          results << BudgetItem.where(project_id: id, date: date).first_or_create
        end
      end
      results.sort_by(&:date)
    end

end
