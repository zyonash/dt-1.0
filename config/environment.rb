# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dt10::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {

    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "dormtown.com",
    :user_name => "contact@dormtown.com",
    :password => "mynameisurl99",
    :authentication => "plain",
    :enable_starttls_auto => true  }

ActionMailer::Base.default_url_options = { :host => "dormtown.com" }

ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true


