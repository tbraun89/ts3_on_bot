class Bot < ActiveRecord::Base

  BASIC_SETTINGS = 0

  has_and_belongs_to_many :users

  attr_accessible :name, :running, :server_address, :server_port, :server_id, :query_user, :query_password

  validates :name, :presence => true, :uniqueness => true

  def users_for_manager
    users_available = User.where(:admin => false).all
    users.each do |user|
      users_available.delete(user)
    end
    users_available
  end

  def self.active
    Bot.where(:running => true)
  end

  def self.paused
    Bot.where(:running => false)
  end

  def to_s
    name
  end

end
