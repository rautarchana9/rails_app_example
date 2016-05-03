class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :borrower_name
      t.integer :loan_number
      t.integer :principal_loan_amount
      t.date :closing_date
      t.date :first_payment_date
      t.integer :interest_rate
      t.integer :term
      t.string :type

      t.timestamps
    end
  end
end
