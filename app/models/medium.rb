require 'streamio-ffmpeg'

# Medium model
class Medium < ApplicationRecord
  belongs_to :library

  def path
    File.join(library.path, name)
  end

  def read_metadata
    FFMPEG::Movie.new(path)
  end
end
