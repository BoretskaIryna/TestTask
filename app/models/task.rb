class Task < ApplicationRecord
  belongs_to :pm, class_name: "User"
  belongs_to :collaborator, class_name: "User"

  validates :pm_id, :inclusion => { :in =>  User.where(project_manager: true).ids,
                                    :message    => "%{value} is not a valid pm_id" }
  validates :collaborator_id,  :inclusion => { :in =>  User.where(project_manager: false).ids,
                                   :message    => "%{value} is not a valid collaboration_id" }
  validates :type_task, :inclusion => {:in =>  ['bug fix', 'code', 'test'],
                                       :message    => "%{value} is not a valid type_task"}
  validates :status, :inclusion => {:in =>  ['new', 'open', 'in progress', 'done'],
                                       :message    => "%{value} is not a valid status"}
  validates :name, presence: true
end
