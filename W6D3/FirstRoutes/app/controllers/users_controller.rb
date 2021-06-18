class UsersController < ApplicationController
  def index
    # if user_params.empty?
    #   @users = User.all
    #   render json: @users
    # else
    #   @user = User.where(username: user_params)
    #   if @user.empty?
    #     @users = User.all
    #     render json: @users
    #   else
    #     render json: @user.first
    #   end
    # end

    if params[:user][:username]
      @user = User.where(username: params[:user][:username])
      if @user.empty?
        @users = User.all
        render json: @users
      else
        render json: @user.first
      end
    else
      @users = User.all
      render json: @users
    end

    # @users = User.all
    # if params[:user]
    #   if params[:user][:username]
    #     @user = User.where(username: params[:user][:username])
    #     if @user.empty?
    #       render json: @users
    #     else
    #       render json: @user.first
    #     end
    #   else
    #     render json: @users
    #   end
    # else
    #   render json: @users
    # end
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
