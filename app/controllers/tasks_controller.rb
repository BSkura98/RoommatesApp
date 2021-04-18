class TasksController < ApplicationController
  before_action :set_task_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET task_lists/1/tasks
  def index
    @tasks = @task_list.tasks
  end

  # GET task_lists/1/tasks/1
  def show
  end

  # GET task_lists/1/tasks/new
  def new
    @task = @task_list.tasks.build
  end

  # GET task_lists/1/tasks/1/edit
  def edit
  end

  # POST task_lists/1/tasks
  def create
    @task = @task_list.tasks.build(task_params)

    if @task.save
      redirect_to(@task.task_list)
    else
      render action: 'new'
    end
  end

  # PUT task_lists/1/tasks/1
  def update
    if @task.update(task_params)
      redirect_to([@task.task_list, @task], notice: 'Task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE task_lists/1/tasks/1
  def destroy
    @task.destroy

    redirect_to task_list_tasks_url(@task_list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end

    def set_task
      @task = @task_list.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:description, :completed, :completed_at, :task_list_id)
    end
end
