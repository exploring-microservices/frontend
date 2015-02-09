require "lotus/controller"
require "frontend/deployments/index"

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
        Index.render(format: format)
      end
    end
  end
end
