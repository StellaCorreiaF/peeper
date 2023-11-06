# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # Substitua pelo domínio do seu aplicativo Vue.js
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
