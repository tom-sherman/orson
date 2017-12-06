# Directory controller
class DirectoryController < ApplicationController
  def list
    @directory = Directory.new path: params[:path]
    @path = File.absolute_path(params[:path])
    @entries = @directory.entries.map { |entry| { name: entry, type: File.ftype(d = "#{params[:path]}#{File::SEPARATOR}#{entry}") } }
  end
end
