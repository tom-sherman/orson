# Medium model
class Medium < ApplicationRecord
  belongs_to :library

  def path
    File.join(library.path, name)
  end
end
