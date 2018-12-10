class Book < ApplicationRecord
  belongs_to :genre
  has_many   :chapters
  validates :name, presence: true
  validates :floor, presence: true
end
