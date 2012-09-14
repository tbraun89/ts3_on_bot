class Bot < ActiveRecord::Base

  has_and_belongs_to_many :users

  attr_accessible :name, :running

  validates :name, :uniqueness => true

end
