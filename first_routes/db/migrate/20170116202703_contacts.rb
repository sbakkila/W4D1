class Contacts < ActiveRecord::Migration[5.0]
  def change

    create_table :contacts do |t|
     t.string :name, null: false
     t.string :email, null: false
     t.integer :user_id, null: false

     t.timestamps

    end

     add_index(:contacts, :user_id)
  end
end
