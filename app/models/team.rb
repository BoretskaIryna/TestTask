class Team < ApplicationRecord
  belongs_to :leader, class_name: "User"
  has_many :membership, class_name: "Member",
           foreign_key: "team_id",
           dependent: :destroy
  has_many :members, through: :membership, source: :collaborator


  validates :leader_id, :inclusion => { :in =>  User.where(project_manager: true).ids,
                                        :message    => "%{value} is not a valid pm_id" }


end
