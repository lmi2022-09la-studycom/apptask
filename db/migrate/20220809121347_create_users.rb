class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.date :birth_date
      t.string :email, null:false
      t.string :password_digest, null:false

      t.timestamps
    end
  end
end
