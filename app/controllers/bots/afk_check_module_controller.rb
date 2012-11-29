class Bots::AfkCheckModuleController < ApplicationController

  def save
    @bot = Bot.find(params[:id])
    authorize! :update, @bot

    @bot.afk_check_module.update_attribute(:channel_name, params[:afk_check][:afk_channel])
    flash[:notice] = I18n::t('bots.modules.afk_check.controller.saved_notice')

    redirect_to @bot
  end

end
