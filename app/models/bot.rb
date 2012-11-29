class Bot < ActiveRecord::Base

  AFK_CHECK = 0

  has_and_belongs_to_many :users
  belongs_to              :afk_check_module

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

  def stop
    Bots::Application.remove_bot self.id
    update_attribute :running, false
    sleep 1
  end

  def start
    Bots::Application.add_bot self.id
    update_attribute :running, true
    sleep 1
  end

  def restart
    self.stop
    self.start
  end

  def change_module_state(model_id)
    if model_id == AFK_CHECK.to_s
      if afk_check_module.nil?
        update_attribute(:afk_check_module, AfkCheckModule.create)
      else
        afk_check_module.destroy
      end
    end
  end

  def to_s
    name
  end

end
