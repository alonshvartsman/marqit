class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

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
      render 'confirmation'
      # redirect to @report, notice: 'Report was successfully created'
    else
      render :new
    end
  end

  def new
    @report = Report.new
  end

  def vote_up
    begin
      current_user.vote_for(@report = Report.find(params[:id]))
      respond_to do |format|
        format.html { redirect_to reports_path }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
      # redirect_to reports_path(reports: Report.all)
    rescue ActiveRecord::RecordInvalid
      redirect_to reports_path(reports: Report.all)
    end
  end

  def report_params
    params.require(:report).permit(:photo, :cagtegory, :description, :location, :upvotes, :user_id, :longitude, :latitude)
  end
end
