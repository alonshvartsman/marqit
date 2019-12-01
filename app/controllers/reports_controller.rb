class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    # authorize @report
    if @report.save
      # redirect to @report, notice: 'Report was successfully created'
    else
      render :new
    end
  end

  def report_params
    params.require(:report).permit(:photo, :cagtegory, :description, :location, :upvotes, :user_id, :longitude, :latitude)
  end
end
