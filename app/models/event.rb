class Event < ActiveRecord::Base
  attr_accessible :page_views, :description, :location, :name, :eventdate, :eventtime


  def self.search(search)
    if search
      find(:all, :conditions => ['name ILIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
