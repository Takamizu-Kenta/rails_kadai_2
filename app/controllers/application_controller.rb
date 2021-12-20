class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [ :avatar] )
        devise_parameter_sanitizer.permit(:account_update, keys: [ :avatar])
    end

    before_action :set_search

    def set_search
      @search = Room.ransack(params[:search])
  
      @rooms = @search.result(distinct: true)
  
    end
end
