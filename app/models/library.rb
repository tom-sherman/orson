# Library model
class Library < ApplicationRecord
  has_many :media

  # TODO: Add directory exists validation
  validates :path, presence: true
end
