class HomeController < ApplicationController

  layout 'home_layout'

  def index
    if current_user
      redirect_to events_url
    end
  end

  def new
  end

end
