require "frontend/deployments/deployment"
require "registrar/deployments/fetch_all"

module Frontend
  module Deployments
    class FetchDeployments
      def self.[]
        new.execute
      end

      def execute
        fetch_deployments
      end

      private

      def fetch_deployments
        deployments.map do |deployment_data|
          Deployment.new(deployment_data)
        end
      end

      def deployments
        Registrar::Deployments::FetchAll[]
      end
    end
  end
end
