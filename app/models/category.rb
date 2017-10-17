class Category < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
end
