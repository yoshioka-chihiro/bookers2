class UsersController < ApplicationController
  def create
    @user = User.new(name:params[:name], email:params[:email], image_name: "default_image.jpg")
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
  end

end
