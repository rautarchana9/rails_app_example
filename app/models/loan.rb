class Loan < ActiveRecord::Base
  validates :borrower_name, presence: true, length: {maximum: 50}
  validates :loan_number, presence: true, uniqueness: true, numericality: {only_integer: true}
  validates :principal_loan_amount, presence: true, numericality: {only_integer: true}
  validates :closing_date, presence: true 
  validates :first_payment_date, presence: true
  validates :interest_rate, presence: true, numericality: {only_integer: true}
  validates :term, presence: true, numericality: {only_integer: true}
  validates :loan_type, presence: true
  def monthly_payment 
    monthly_rate = self.interest_rate / 1200.0
    a = monthly_rate * self.principal_loan_amount
    b = 1 - (1 + monthly_rate)**(-self.term)
    annuity = (a / b).round(2)
  end
end
