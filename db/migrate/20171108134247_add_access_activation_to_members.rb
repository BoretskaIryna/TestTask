class AddAccessActivationToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :activation_digest, :string
    add_column :members, :activated, :boolean, default: false
    add_column :members, :activated_at, :datatime
  end
end
