class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.text :note

      t.timestamps
    end
  end
end
