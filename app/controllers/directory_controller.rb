# Directory controller
class DirectoryController < ApplicationController
  def list
    @directory = Directory.new path: params[:path]
    @path = @directory.absolute_path
    @entries = @directory.entries
  end
end
