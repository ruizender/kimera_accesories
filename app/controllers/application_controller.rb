class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def crud_to_admin
    unless current_user.admin == true && current_user.present?
      redirect_to root_path
    end
  end

  def current_order
    if current_user
      order = Order.find_or_create_by(user_id: current_user.id, status: 0)
    end
  end

  
end