class AfkCheckModule < ActiveRecord::Base

  has_one :bot

  attr_accessible :channel_name

end
