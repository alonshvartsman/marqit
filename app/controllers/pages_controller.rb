class PagesController < ApplicationController
  def dashboard
    if current_user
      @reports = current_user.reports
      @events = current_user.attendances
      # authorize @events
      # authorize @reports
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect root_path
    end
  end
end
