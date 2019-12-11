class PagesController < ApplicationController
  def dashboard
    if current_user
      @reports = current_user.reports
      @events = current_user.events
      # authorize @events
      # authorize @reports
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to new_user_session
    end
  end

  def help

  end
end
