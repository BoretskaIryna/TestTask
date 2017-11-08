class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :team_id
      t.integer :collaborator_id

      t.timestamps
    end

    add_index :members, :team_id
    add_index :members, :collaborator_id
    add_index :members, [:team_id, :collaborator_id], unique: true
  end
end
