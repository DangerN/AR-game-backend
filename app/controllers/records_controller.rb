class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: :leaders

  # GET /leaders
  def leaders
    render json: leader_board_list
  end

  # GET /records
  def index
    @records = Record.all

    render json: @records
  end

  # GET /records/1
  def show
    render json: @record
  end

  # POST /records
  def create
    @record = Record.new(record_params)

    if @record.save
      render json: leader_board_list, status: :created #, location: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  def destroy
    @record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def record_params
      params.require(:record).permit(:user_id, :time)
    end

    # Returns the five fastest clear times with name of user.
    def leader_board_list
      @completion_times = Record.all
      @completion_times.sort_by{|object| object[:time]}[0..4].map{ |time| {time: time.time, name: time.user.name}}
    end
end
