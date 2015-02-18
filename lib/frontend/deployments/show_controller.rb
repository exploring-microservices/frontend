require "lotus/controller"
require "frontend/deployments/show"
require "frontend/deployments/fetch_deployment_by_id"

module Frontend
  module Deployments
    class ShowController
      include Lotus::Action

      def call(params)
        self.format = :html
        self.body = render_show
      end

      private

      def render_show
        Show.render(format: format, deployment: deployment)
      end

      def deployment
        FetchDeploymentById[params[:id]]
      end
    end
  end
end
