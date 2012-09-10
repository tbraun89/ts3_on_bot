class UsersController < ApplicationController

  def index
    authorize! :manage, User
    @users = User.all
  end

  def new
    @user = User.new
    authorize! :create, @user
  end

  def create
    @user = User.new params[:user]
    authorize! :create, @user

    if @user.save
      flash[:notice] = I18n::t('users.controller.create_notice')
      redirect_to users_path
    else
      flash[:alert] = I18n::t('users.controller.create_alert')
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user

    if params[:user][:password] == "" && params[:user][:password_confirmation] == ""
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = I18n::t('users.controller.update_notice')
      redirect_to users_path
    else
      flash[:alert] = I18n::t('users.controller.update_alert')
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user

    if @user.destroy
      flash[:notice] = I18n::t('users.controller.destroy_notice')
    else
      flash[:alert] = I18n::t('users.controller.destroy_error')
    end

    redirect_to users_path
  end

end
