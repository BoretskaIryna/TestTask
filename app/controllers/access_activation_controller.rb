class AccessActivationController < ApplicationController
  def edit
    member = Member.find(params[:member_id])
    if member && !member.activated? && member.accessed?(params[:id])
      member.update_attribute(:activated,    true)
      member.update_attribute(:activated_at, Time.zone.now)

      flash[:success] = "You access team!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
