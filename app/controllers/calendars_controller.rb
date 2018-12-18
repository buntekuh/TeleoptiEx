class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit]

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
        format.html { render :show, status: :created, location: @calendar }
      else
        format.html { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /calendars/:name/edit
   def edit
     render layout: false
   end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    params.permit(:utf8, :authenticity_token, :month, :year, :id, :data)
    @calendar = Calendar.find(params[:id])
    debugger
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { head :ok }
     else
        format.html { head :unprocessable_entity }
      end
     end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find_by_name(params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.permit(:name)
    end
end
