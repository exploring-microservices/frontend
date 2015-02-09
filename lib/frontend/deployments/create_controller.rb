require "lotus/controller"
require "frontend/deployments/create_deployment"

module Frontend
  module Deployments
    class CreateController
      include Lotus::Action

      def call(params)
        redirect_to deployment_path(deployment)
      end

      private

      def deployment_path(deployment)
        "/deployment/#{deployment.id}"
      end

      def deployment
        CreateDeployment[attributes]
      end

      def attributes
        {
          name: params[:name]
        }
      end
    end
  end
end
