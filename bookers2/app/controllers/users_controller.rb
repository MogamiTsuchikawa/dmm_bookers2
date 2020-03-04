class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "user edit successfully"
    else
      flash[:notice] = "user edit error"
    end
      redirect_to(user_path(current_user.id))
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
