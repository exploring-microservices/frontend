require "tilt/erubis"
require "lotus/view"
require "frontend/template/application_layout"

module Frontend
  module Deployments
    class Index
      include Lotus::View
      layout Frontend::Template::ApplicationLayout

      def create_path
        "/deployment/create"
      end
    end
  end
end
