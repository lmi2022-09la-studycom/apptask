class TasksController < ApplicationController
    before_action :require_logged_in
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = Task.all
    end
  
    def show
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        flash[:success] = '登録しました'
        redirect_to root_path
      else
        flash[:danger] = '登録できませんでした'
        render root_path
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
  
    private
    def task_params
        params.require(:task).permit(:content)
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
