class ApplicationController < ActionController::Base

  helper_method :running_bots
  helper_method :paused_bots

  protect_from_forgery

  before_filter :authenticate_user!

  check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do
    flash[:alert] = I18n::t('cancan.access_denied')

    begin
      redirect_to :back
    rescue
      redirect_to root_path
    end
  end

  def running_bots
    bot_list(true)
  end

  def paused_bots
    bot_list(false)
  end

  private

  def bot_list(running)
    if current_user.admin?
      Bot.joins(:users).where(:running => running)
    else
      Bot.joins(:users).where(:running => running).where("bots_users.user_id" => current_user.id)
    end
  end

end
