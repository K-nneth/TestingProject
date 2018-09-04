class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy]

 # GET /todos
  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /todos/:id
  def show
    json_response(@user)
  end

  # PUT /todos/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.permit(:name, :email,:password,:phone,:gopay,)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
