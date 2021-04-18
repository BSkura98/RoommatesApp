class Task < ApplicationRecord
  belongs_to :task_list

  scope :completed, -> do
  	where(completed: true)
  end
end
