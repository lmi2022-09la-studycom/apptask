class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show]
    before_action :already_logged_in, only: [:new, :create]
    def show
      @user = current_user
      @tasks = current_user.tasks.paginate(page: params[:page], per_page: 20).all
      @task = Task.new
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = '登録しました'
        redirect_to root_path
      else
        flash.now[:danger] = '登録できませんでした'
        render :new
      end
    end
  
    private
    def user_params
      params.require(:user).permit(
        :name, :birth_date, :email, :password, :password_confirmation
      )
    end
  
end
