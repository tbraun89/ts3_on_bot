class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_user!

  check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do
    flash[:alert] = I18n::t('cancan.access_denied')
    redirect_to :back
  end

end
