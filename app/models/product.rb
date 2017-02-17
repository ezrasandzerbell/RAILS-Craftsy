class Product < ApplicationRecord
  has_many :reviews
  belongs_to :user

  has_attached_file :imgfile, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imgfile, content_type: /\Aimage\/.*\z/

  validates :name, :presence => true
  validates :details, :presence => true
  validates :cost, :presence => true
end
