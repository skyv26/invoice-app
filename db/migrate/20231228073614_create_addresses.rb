class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :type, null: false, default: 'client'
      t.string :street, null: false
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
