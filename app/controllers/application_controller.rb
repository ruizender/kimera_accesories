class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  




  def crud_to_admin
    unless current_user.admin == true && current_user.present?
      redirect_to root_path
    end
  end


end