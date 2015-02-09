require "lotus/controller"
require "frontend/deployments/index"
require "frontend/deployments/fetch_deployments"

module Frontend
  module Deployments
    class IndexController
      include Lotus::Action

      def call(params)
        self.format = :html
        self.body = render_index
      end

      private

      def render_index
        Index.render(format: format, deployments: deployments)
      end

      def deployments
        FetchDeployments[]
      end
    end
  end
end
