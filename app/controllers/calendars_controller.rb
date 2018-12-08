class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = Calendar.all.order(:name)
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
    
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.json { render :show, status: :created, location: @calendar }
      else
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:name)
    end
end
