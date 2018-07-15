class Listing < ApplicationRecord
	belongs_to :user
	has_many :reviews

	 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  searchkick
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_file_name, presence: true
  validates :product_no, presence: true

end


