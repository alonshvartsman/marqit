class ReportsController < ApplicationController
# skip_before_action :authenticate_user!, only: [:index]

  def index
    @reports = Report.all

    @reports = Report.geocoded #returns flats with coordinates

    @markers = @reports.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { report: report })
      }
    end
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
