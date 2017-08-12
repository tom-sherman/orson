render_partial |= false

json.extract! medium, :id, :name

unless render_partial
  json.path medium.path
  json.library do
    json.partial! medium.library, render_partial: true
  end
  json.extract! medium, :created_at, :updated_at
end

json.url medium_url(medium, format: :json)
