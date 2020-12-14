class Api::V1::LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]

  # GET api/vi/tasks/
  def index
    @logs = Log.all
    render json: { status: 'success', data: @logs }
  end

  # GET api/vi/tasks/:id
  def show
    render json: { status: 'success', data: @log }
  end

  # Post api/vi/tasks
  def create
    p "########################"
    p log_params
    @log = Log.new(log_params)
    if @log.save
      render json: { status: 'success', data: @log }
    else
      render json: { status: 'error', data: @log.errors }
    end
  end

  # Put api/vi/tasks/:id
  def update
    if @log.update(log_params)
      render json: { status: 'success', data: @log }
    else
      render json: { status: 'error', data: @log.errors }
    end
  end

  # Delete api/vi/tasks/:id
  def destroy
    @log.destroy
    render json: { status: 'success', data: @log }
  end

  private
  def log_params
    params.permit(:uri)
  end

  def set_log
    @log = Log.find(params[:id])
  end
end
