class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.string :type_task
      t.integer :pm_id
      t.integer :collaborator_id

      t.timestamps
    end
    add_index :tasks, :pm_id
    add_index :tasks, :collaborator_id

  end
end
