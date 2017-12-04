# Builds a library from scatch
class BuildLibraryJob < ApplicationJob
  queue_as :default

  def perform(library)
    search_pattern = File.join library.path, '**', "*.#{FILE_TYPES}"
    # FIXME: Errors on subdirectories
    Dir.glob search_pattern do |file|
      library.media.create name: File.basename(file)
    end
  end
end
