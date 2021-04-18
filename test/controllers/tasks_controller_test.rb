require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task_list = task_lists(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get :index, params: { task_list_id: @task_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { task_list_id: @task_list }
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, params: { task_list_id: @task_list, task: @task.attributes }
    end

    assert_redirected_to task_list_task_path(@task_list, Task.last)
  end

  test "should show task" do
    get :show, params: { task_list_id: @task_list, id: @task }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { task_list_id: @task_list, id: @task }
    assert_response :success
  end

  test "should update task" do
    put :update, params: { task_list_id: @task_list, id: @task, task: @task.attributes }
    assert_redirected_to task_list_task_path(@task_list, Task.last)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, params: { task_list_id: @task_list, id: @task }
    end

    assert_redirected_to task_list_tasks_path(@task_list)
  end
end
