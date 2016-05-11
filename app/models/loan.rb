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

  def generate_schedule
    schedule = []
    monthly_payment_amount = monthly_payment
    next_payment_date = self.closing_date >> 1
    for month in 1..self.term
      monthly_schedule = []
      next_payment_date = next_payment_date >> 1
      monthly_schedule << next_payment_date << monthly_payment_amount
      schedule << monthly_schedule
    end
    schedule
  end

  def update_progress
     progress = 0.0
     while progress < 0.9
       progress += 0.1
       Thread.current['progress'] = progress
       sleep 1
     end
  end
end
