module ApplicationHelper

  def only_pm
    unless current_user.project_manager
      redirect_to root_url
    end
  end
end
