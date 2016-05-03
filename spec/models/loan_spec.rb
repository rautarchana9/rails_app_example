require 'rails_helper'

RSpec.describe Loan, type: :model do
  it { should validate_presence_of (:borrower_name) }
  it { should validate_presence_of (:loan_number) }
  it { should validate_presence_of (:principal_loan_amount) }
  it { should validate_presence_of (:closing_date) }
  it { should validate_presence_of (:first_payment_date) }
  it { should validate_presence_of (:interest_rate) }
  it { should validate_presence_of (:term) }
  it { should validate_presence_of (:type) }
  
end
