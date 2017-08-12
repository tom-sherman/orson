# Base helper
module ApplicationHelper
  def react_tag(app)
    javascript_pack_tag(app) unless app.empty?
  end
end
