# A model that represents a Directory object
class Directory
  include ActiveModel::Model

  attr_accessor :path

  def entries(hidden = false)
    return Dir.entries(@path).reject { |x| x =~ /^\.{1,2}/ } unless hidden
    Dir.entries(@path).reject { |x| x =~ /^\.{1,2}$/ }
  end

  def absolute_path
    File.absolute_path(@path)
  end
end

class Entry
  include ActiveModel::Model

  attr_accessor :name, :directory_path

  def type
    File.ftype("#{@directory_path}#{File::SEPERATOR}#{@name}")
  end

  def directory
    Directory.new :directory_path
  end
end
