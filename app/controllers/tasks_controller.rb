class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy, :show]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    
  end

  def show

  end

  def create
    @task = Task.new(task_params)

    if @task.save
      # 成功
      redirect_to tasks_path, notice: "新增成功!"
    else
      # 失敗
      render :new
    end
  end

  def update
    

    if @task.update(task_params)
      # 成功
      redirect_to tasks_path, notice: "編輯成功!"
    else
      # 失敗
      render :edit
    end
  end

  def destroy
    if @task.due_date.past?
      redirect_to tasks_path, notice: "日期已過無法刪除!"
    else
      @task.destroy if @task
      redirect_to tasks_path, notice: "資料已刪除!"
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :due_date, :note)
    end

    def find_task
      @task = Task.find_by(id: params[:id])
    end

end
