json.extract! task_list_task, :id, :description, :completed, :completed_at, :task_list_id, :created_at, :updated_at
json.url task_list_task_url(task_list_task, format: :json)
