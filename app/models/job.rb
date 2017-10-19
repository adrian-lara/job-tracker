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

  def self.by_location(city)
    where(city: city)
  end

  def self.interest_counts
    interest_level_data = []
    interest_level_counts.each_pair do |k, v|
      interest_level_data << {level: k, job_count: v}
    end
    interest_level_data
  end

  def self.interest_level_counts
    order(level_of_interest: :desc).group(:level_of_interest).count
  end

  def self.top_three
    select('name, avg(level_of_interest) AS avg_interest')
      .joins(:company)
      .group(:name)
      .order('avg_interest desc')
      .limit(3)
  end

  def self.locations
    select(:city, 'count(id) AS job_count')
      .group(:city)
      .order(:city)
  end

end
