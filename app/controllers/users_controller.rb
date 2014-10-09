# This file is app/controllers/users_controller.rb
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = User.find(id) # Look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def new
	if(params[:user_id])
		@user = User.create!(params[:user_id])
		flash[:notice] = "#{@user.user_id} was successfully created."
		redirect_to movies_path
	end
  end

  def create
    redirect_to new_user_path
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user_id])
    flash[:notice] = "User '#{@user.user_id}' was successfully updated."
    redirect_to edit_users_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.user_id}' deleted."
    redirect_to movies_path
  end

end
