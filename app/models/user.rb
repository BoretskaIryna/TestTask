class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  #has_many :tasks

  has_many :pm_task,  class_name:  "Task",
           foreign_key: "pm_id",
           dependent:   :destroy

  has_many :coll_task, class_name:  "Task",
           foreign_key: "collaborator_id",
           dependent:   :destroy

  #some wrong gets
  #has_many :pmtask, through: :pm_task, source: :pm
  #has_many :collt, through: :collaborator_task, source: :collaborator

  #get users who have assigned some task by current pm
  #has_many :collt, through: :pm_task, source: :collaborator

  #get pms who have assigned task to current user
  #has_many :pmtask, through: :collaborator_task, source: :pm

  has_many :teams, class_name: "Team",
            foreign_key: "leader_id",
            dependent: :destroy



end
