class Review < ApplicationRecord
  belongs_to :product

  validates :title, :presence => true
  validates :content, :presence => true
end
