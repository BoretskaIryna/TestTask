class Member < ApplicationRecord
  belongs_to :collaborator, class_name: "User"
end
