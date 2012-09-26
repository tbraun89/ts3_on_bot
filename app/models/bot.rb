class Bot < ActiveRecord::Base

  has_and_belongs_to_many :users

  attr_accessible :name, :running, :server_address, :server_port, :server_id, :query_user, :query_password

  validates :name, :presence => true, :uniqueness => true

end
