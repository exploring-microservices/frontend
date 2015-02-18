require "lotus/router"
require "frontend/deployments/index_controller"
require "frontend/deployments/create_controller"
require "frontend/deployments/show_controller"

module Frontend
  module Config
    class Routes

      def call(env)
        routes.call(env)
      end

      private

      def routes
        Lotus::Router.new do
          get "/", to: Deployments::IndexController
          get "/deployments/:id", to: Deployments::ShowController
          post "/deployments/create", to: Deployments::CreateController
        end
      end

    end
  end
end
