# A model that represents a Directory object
class Directory
  include ActiveModel::Model

  attr_accessor :path

  def entries(hidden = false, show_files = false)
    entries = if hidden
                Dir.entries(@path).reject { |x| x =~ /^\.{1,2}$/ }
              else
                Dir.entries(@path).reject { |x| x =~ /^\.{1,2}/ }
              end

    entries.map! { |n| Entry.new name: n, directory_path: absolute_path }
    entries.select { |e| e.type == 'directory' } unless show_files
  end

  def absolute_path
    File.absolute_path(@path)
  end

  def parent
    # Is this cross platform?
    Directory.new path: "#{@path}#{File::SEPARATOR}.."
  end
end

# Models an entry in the file system
class Entry
  include ActiveModel::Model

  attr_accessor :name, :directory_path

  def type
    File.ftype absolute_path
  end

  def directory
    Directory.new :directory_path
  end

  def absolute_path
    "#{@directory_path}#{File::SEPARATOR}#{@name}"
  end

  def empty?
    Dir.entries(absolute_path).reject { |x| x =~ /^\.{1,2}/ }.length.zero?
  rescue
    false
  end
end
