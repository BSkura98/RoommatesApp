class TaskList < ApplicationRecord
  has_many :tasks

  def uncompleted_tasks
  	@uncompleted_tasks ||= tasks.count - tasks.completed.count
  end
end
