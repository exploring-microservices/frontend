require "frontend/application"

use Rack::Reloader, 0
run Frontend::Application.new
