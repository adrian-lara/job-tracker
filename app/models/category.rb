class Category < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }

  def self.alphabetical
    order(:title)
  end

end
