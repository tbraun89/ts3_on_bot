class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  attr_accessible :username, :password, :password_confirmation, :remember_me, :admin, :email

  validates :username, :uniqueness => true
  validates :email,    :uniqueness => true

  def role_name
    admin? ? I18n::t('users.controller.admin') : I18n::t('users.controller.user')
  end

end
