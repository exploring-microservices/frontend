require "tilt/erubis"
require "lotus/view"
require "frontend/template/application_layout"

module Frontend
  module Deployments
    class Show
      include Lotus::View
      layout Frontend::Template::ApplicationLayout
    end
  end
end
