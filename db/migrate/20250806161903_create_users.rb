class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.date :date_of_birth
      t.boolean :admin

      t.timestamps
    end
  end
end
