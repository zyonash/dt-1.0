class Event < ActiveRecord::Base
  attr_accessible :location, :name, :eventdate, :eventtime
  default_scope order("created_at DESC")
end
