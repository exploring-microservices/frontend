require "dotenv"
require "frontend/config/routes"

module Frontend
  class Application
    def initialize
      Dotenv.load
    end

    def call(env)
      routes.call(env)
    end

    private

    def routes
      @routes ||= Frontend::Config::Routes.new
    end
  end
end
