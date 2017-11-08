json.extract! task, :id, :name, :status, :type_task, :pm_id, :collaborator_id, :created_at, :updated_at
json.url task_url(task, format: :json)
