class AudioBook < ApplicationRecord
  belongs_to :genre
  validates :name, presence: true
  validates :floor, presence: true
end
