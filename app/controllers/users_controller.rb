class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    render layout: 'mypage'
  end

  def show
    render layout: 'user_page'
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
