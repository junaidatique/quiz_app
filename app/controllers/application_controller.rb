class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
  
end
