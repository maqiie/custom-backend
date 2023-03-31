# This file is used by Rack-based servers to start the application.
require 'rack/cors'
require_relative "config/environment"

run Rails.application
Rails.application.load_server


use Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :options]
  end
end
