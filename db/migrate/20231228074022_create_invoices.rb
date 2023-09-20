class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.string :description, null: false
      t.integer :payment_terms, null: false
      t.date :payment_due_date, null: false
      t.string :status, default: 'pending'
      t.decimal :total, null: false
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
