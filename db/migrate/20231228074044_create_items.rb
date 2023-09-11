class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price_per_unit
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
