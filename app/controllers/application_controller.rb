class ApplicationController < ActionController::Base
  private
  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      redirect_to wikis_path
    end
  end
end
