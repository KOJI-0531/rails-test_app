class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(create_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to users_index_path
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(update_params)
    @user.save
    redirect_to users_index_path
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_index_path
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_index_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_form_path
  end

  private

  def create_params
    params.require(:user).permit(:name, :email, :password)
  end

  def update_params
    params.require(:user).permit(:name, :email, :password)
  end

end
