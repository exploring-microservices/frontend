require "lotus/controller"
require "frontend/deployments/create_deployment"

module Frontend
  module Deployments
    class CreateController
      include Lotus::Action

      def call(params)
        redirect_to deployments_path(deployment)
      end

      private

      def deployments_path(deployment)
        "/deployments/#{deployment.id}"
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
