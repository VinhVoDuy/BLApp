class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :set_cache_headers

  private

  def set_cache_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization' 
  end
end
