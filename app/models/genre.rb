class Genre < ApplicationRecord
  has_many :books
  has_many :audio_books
  validates :name, presence: true
end
