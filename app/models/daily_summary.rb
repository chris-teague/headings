class DailySummary < ActiveRecord::Base

  belongs_to :project

  validates :date, uniqueness: { scope: :project_id }
  validates :date, presence: true

  attr_accessor :timestamp

  def to_s
    "#{date.strftime('%b %Y')}"
  end

end
