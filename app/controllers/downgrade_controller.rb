class DowngradeController < ApplicationController

  def new
  end

  def create
    current_user.update_attribute(:role, 'standard')
    # re = Stripe::Refund.create( charge: "")
    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public."
    redirect_to root_path
  end
end
