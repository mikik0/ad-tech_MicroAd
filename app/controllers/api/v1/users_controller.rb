class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET api/vi/tasks/
  def index
    @users = User.all
    render json: { status: 'success', data: @users }
  end

  # GET api/vi/tasks/:id
  def show
    render json: { status: 'success', data: @user }
  end

  # Post api/vi/tasks
  def create
    user = User.find_by(user_params)
    p "&&&&&&&&&&&&&&&&&&&"
    p user_params
    if user.nil?
      @user = User.new({user_id: User.count + 1})
      if @user.save
        render json: { status: 'success new', data: @user }
      else
        render json: { status: 'error', data: @user.errors }
      end
    else

      render json: { status: 'success', data: user }
    end
  end

  # Put api/vi/tasks/:id
  def update
    if @user.update(user_params)
      render json: { status: 'success', data: @user }
    else
      render json: { status: 'error', data: @user.errors }
    end
  end

  # Delete api/vi/tasks/:id
  def destroy
    @user.destroy
    render json: { status: 'success', data: @user }
  end

  private
  def user_params
    params.permit(:user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
