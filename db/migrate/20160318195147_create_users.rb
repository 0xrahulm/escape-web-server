class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :id => false do |t|
      t.string :uuid, limit: 36, primary: true, null: false
      t.string :first_name, limit: 80
      t.string :last_name, limit: 80
      t.string :email
      t.string :password_digest
      t.integer :gender, limit: 1
      t.integer :logged_in_using, limit: 2

      t.timestamps null: false
    end

    add_index :users, :uuid
    add_index :users, [:first_name, :last_name], name: 'first_name_last_name_index'
  end
end
