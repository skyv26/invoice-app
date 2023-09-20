class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :email_address, null: false
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
