class UsersController < ApplicationController
  def create
    @user = User.new(name:params[:name], email:params[:email], image_name: "default_image.jpg")
  end

  def index
    @users = User.all
    # 部分テンプレート用の変数
    @book = Book.new
    @user = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
     redirect_to user_path
    else
     render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end


end
