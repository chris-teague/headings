class Staff < ActiveRecord::Base

  belongs_to :project
  validates :first_name, :email, :project_id, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end

end
