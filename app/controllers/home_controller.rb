class HomeController < ApplicationController

  layout 'home_layout'

  def index
    if user_signed_in?
      redirect_to events_url
    end
  end

  def new
  end

end
