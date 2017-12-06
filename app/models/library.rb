# Library model
class Library < ApplicationRecord
  has_many :media

  # TODO: Add directory exists validation
  validates :path, presence: true

  after_create :build
  before_destroy :delete_media

  private

  def delete_media
    media.destroy_all
  end

  def build
    BuildLibraryJob.perform_now self
  end
end
