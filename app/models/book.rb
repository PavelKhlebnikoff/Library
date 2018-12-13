class Book < ApplicationRecord
  belongs_to :genre
  has_many   :chapters
  validates :name, presence: true
  validates :floor, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
