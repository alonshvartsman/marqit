class ReportsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]

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

  def new
    @report = Report.new
  end

  def report_params
    params.require(:report).permit(:photo, :cagtegory, :description, :location, :upvotes, :user_id, :longitude, :latitude)
  end
end
