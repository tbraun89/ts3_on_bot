class BotsController < ApplicationController

  def show
    @bot = Bot.find(params[:id])
    authorize! :update, @bot
  end

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

  def update
    @bot = Bot.find(params[:id])
    authorize! :update, @bot

    if params.key?(:bot)
      update_bot(params)
    end

    redirect_to bot_path(@bot)
  end

  def add_user
    @bot                  = Bot.find(params[:id])
    authorize! :manage, @bot

    @bot.users << User.where(:username => params[:add_user][:user]).first
    @bot.save!

    flash[:notice] = t('bots.controller.add_user_notice')
    redirect_to bot_path(@bot)
  end

  def remove_user
    @bot                  = Bot.find(params[:id])
    authorize! :manage, @bot

    @bot.users.delete(User.find(params[:uid]))
    @bot.save!

    flash[:notice] = t('bots.controller.remove_user_notice')
    redirect_to bot_path(@bot)
  end

  def set_tab
    authorize! :read, Bot
    session[:current_tab] = "##{params[:tab_name]}"
    render :nothing => true
  end

  private

  def update_bot(params)
    @current_tab = "#basics"

    if @bot.update_attributes(params[:bot])
      flash[:notice] = I18n::t('bots.controller.update_notice')
    else
      flash[:alert] = I18n::t('bots.controller.update_error')
    end
  end

end
