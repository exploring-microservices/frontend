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

      def deployment_path(deployment_id)
        "/deployment/#{deployment_id}"
      end
    end
  end
end
