require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { should validate_presence_of (:borrower_name) }
  it { should validate_presence_of (:loan_number) }
  it { should validate_presence_of (:principal_loan_amount) }
  it { should validate_presence_of (:closing_date) }
  it { should validate_presence_of (:first_payment_date) }
  it { should validate_presence_of (:interest_rate) }
  it { should validate_presence_of (:term) }
  it { should validate_presence_of (:loan_type) }
  it { should validate_length_of (:borrower_name)}
  it { should validate_numericality_of (:loan_number)}
  it { should validate_uniqueness_of (:loan_number)}
  it { should validate_numericality_of (:principal_loan_amount)}
  it { should validate_numericality_of (:interest_rate)}
  it { should validate_numericality_of (:term)}
  #it { should validate_inclusion_of (:loan_type).in_array(["Business", "Credit"])}
  describe "monthly_payment" do
    it "should return the monthly payment to be done towards loan" do
      loan = Loan.new()
      loan.principal_loan_amount = 10000
      loan.interest_rate = 5
      loan.term = 24
      expect((loan).monthly_payment).to eql(438.71)
    end
  end
end
