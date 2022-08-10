class TasksController < ApplicationController
    before_action :require_logged_in
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
    def index
      @user = current_user
      status = params[:status]
      @tasks = current_user.tasks.page(params[:page]).per(20)
      if status.present?
        @tasks = @tasks.where(status: params[:status])
      end
      @task = Task.new #新規作成フォーム用の空インスタンス
    end

    # def search
    #   @user = current_user
    #   @tasks = current_user.tasks.where(status: params[:status]).paginate(page: params[:page], per_page: 20).all
    #   @task = Task.new
    #   render :index
    # end
  
    def show
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = current_user.tasks.build(task_params)
      @task.status = "todo"
      if @task.save
        flash[:success] = '登録しました'
        redirect_to root_path
      else
        flash[:danger] = '登録できませんでした'
        redirect_to root_path
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        flash[:success] = '更新しました！'
        redirect_to root_path
      else
        flash.now[:danger] = '更新できませんでした。'
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      flash[:success] = '削除しました'
      redirect_to root_path
    end
    def destroy_all
      current_user.tasks.where(status: "done").destroy_all
      flash[:success] = '削除しました'
      redirect_to root_path
    end
  
    private
    def task_params
        params.require(:task).permit(:content, :status)
    end
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def correct_user
      unless @task.user_id == current_user.id # user_idはアクセスメソッド
        redirect_to root_path
      end
    end
  
end
