json.path @path
json.url directory_url(@directory)
json.length @entries.length
json.entries @entries, :name, :empty?
