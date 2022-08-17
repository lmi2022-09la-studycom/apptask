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
  
    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update(user_params)
        session[:user_id] = @user.id
        flash[:success] = '更新しました'
        redirect_to root_path
      else
        flash.now[:danger] = '更新できませんでした'
        render :edit
      end
    end

    def newpass
      @user = current_user
      unless @user && @user.authenticate(params[:user][:current_password])
        flash.now[:danger] = 'パスワードが間違っています'
        return render "edit"
      end

      if @user.update(user_params)
        flash[:success] = '変更しました'
        redirect_to root_path
      else
        flash.now[:danger] = '変更できませんでした'
        render :edit
      end
    end

    def destroy
      @user = current_user
      current_user.tasks.destroy_all
      if @user.destroy
        flash[:success] = '退会しました'
        redirect_to signup_path
      end
    end

    private
    def user_params
      params.require(:user).permit(
        :name, :birth_date, :email, :password, :password_confirmation
      )
    end

  end
