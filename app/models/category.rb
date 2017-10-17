class Category < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  has_many :jobs

  def self.alphabetical
    order(:title)
  end

end
