class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content, limit: 255, null: false
      t.string :status, presence: true
      t.string :priority
      t.date :deadline
      
      t.timestamps
    end
  end
end
