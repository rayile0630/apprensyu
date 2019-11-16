class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :require_user_logged_in, only: [:index, :show]

    def index
        @tasks = Task.where(id:session[:user_id]).page(params[:page]).per(7)
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'タスクが正常に作成されました'
            redirect_to @task
        else
            flash[:danger] = 'タスクが作成されませんでした'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        
        if @task.update(task_params)
            flash[:success] = 'タスクは正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクは更新されませんでした'
            render :edits
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = 'タスクは正常に削除されました'
        redirect_to root_url
    end
    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content, :status, :user_id)
    end
end
