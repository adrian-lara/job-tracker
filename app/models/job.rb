class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def sorted_comments
    comments.order(:created_at).reverse
  end

  def self.sort_by(filter)
    return order(:city) if filter == "location"
    order(level_of_interest: :desc) if filter == "interest"
  end

end
