class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.string :description
      t.integer :payment_terms
      t.date :payment_due_date
      t.string :status
      t.decimal :total
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
