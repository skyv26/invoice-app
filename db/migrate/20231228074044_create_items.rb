class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :quantity, null: false
      t.decimal :price_per_unit, null: false, precision: 7, scale: 2
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
