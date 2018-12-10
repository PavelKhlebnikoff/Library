class Chapter < ApplicationRecord
  belongs_to :book
  validates :name, presence: true
end
