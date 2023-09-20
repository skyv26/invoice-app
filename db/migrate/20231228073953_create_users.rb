class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email_address, null: false
      t.string :contact
      t.string :date_of_birth, null: false
      t.string :profile_picture
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
