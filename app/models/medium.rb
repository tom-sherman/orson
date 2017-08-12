# Medium model
class Medium < ApplicationRecord
  belongs_to :library

  def path
    File.join(library.path, name).delete("\u0000")
  end
end
