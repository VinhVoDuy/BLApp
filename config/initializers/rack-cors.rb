if defined? Rack::Cors
  Rails.configuration.middleware.insert_before 0, Rack::Cors do
    allow do
      origins %w[
        https://blriverhotel.com
         http://blriverhotel.com
      ]
      resource '/assets/*'
    end
  end
end
