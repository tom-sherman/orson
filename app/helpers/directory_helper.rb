# Directory Helper
module DirectoryHelper
  def directory_url(directory)
    "#{list_url}.json?path=#{directory.absolute_path}"
  end
end
