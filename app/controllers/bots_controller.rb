class BotsController < ApplicationController

  def new
    @bot = Bot.new
    authorize! :create, @bot
  end

  def create
    @bot = Bot.new(params[:bot])
    authorize! :create, @bot

    if @bot.save
      flash[:notice] = I18n::t('bots.controller.create_notice')
      redirect_to bot_path(@bot)
    else
      flash[:alert] = I18n::t('bots.controller.create_error')
      render 'new'
    end
  end

end
