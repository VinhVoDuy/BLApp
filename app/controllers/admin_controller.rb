class AdminController < ApplicationController
  before_action :authenticate_admin
  protected
    def authenticate_admin
      head(403) unless current_user && current_user.is_admin
    end
end
