class ApplicationController < ActionController::Base
 protect_from_forgery 
  def after_sign_in_path_for(resource)
    "/events"    
  end

  def after_sign_up_path_for(resource)
    "/please_confirm"
  end
end
