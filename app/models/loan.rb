class Loan < ActiveRecord::Base
  validates :borrower_name, presence: true
  validates :borrower_name, presence: true
  validates :borrower_name, presence: true
  validates :borrower_name, presence: true
  validates :borrower_name, presence: true
  validates :loan_number, presence: true
  validates :principal_loan_amount, presence: true
  validates :closing_date, presence: true
  validates :first_payment_date, presence: true
  validates :interest_rate, presence: true
  validates :term, presence: true
  validates :type, presence: true
end
