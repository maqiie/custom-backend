class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.string :status
      t.integer :priority
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
