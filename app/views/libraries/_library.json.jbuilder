render_partial |= false

json.extract! library, :id, :path, :name

unless render_partial
  json.media library.media do |medium|
    json.partial! medium, render_partial: true
  end
  json.extract! library, :created_at, :updated_at
end

json.url library_url(library, format: :json)
