# Base helper
module ApplicationHelper
  def vue_tag(app)
    javascript_pack_tag(app) + stylesheet_pack_tag(app) unless app.empty?
  end
end
