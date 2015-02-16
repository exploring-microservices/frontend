require "dotenv"
require "frontend/config/routes"
require "registrar/configure"

module Frontend
  class Application
    def initialize
      load_dotenv
      configure_registrar
    end

    def call(env)
      routes.call(env)
    end

    private

    def routes
      @routes ||= Frontend::Config::Routes.new
    end

    def configure_registrar
      Registrar.configure do |configuration|
        configuration.registrar_url = ENV["REGISTRAR_URL"]
      end
    end

    def load_dotenv
      Dotenv.load
    end
  end
end
