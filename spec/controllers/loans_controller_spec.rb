require 'rails_helper'

RSpec.describe LoansController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a new instance of loan object" do
      get :new
      expect(assigns(:loan)).to be_a_new(Loan)
    end
  end
  
  describe "#create" do
    before {post :create, {loan:{borrower_name: "Anonymous",loan_number: 7788,principal_loan_amount: 1000,closing_date: Date.parse('2016-05-2'), first_payment_date: Date.parse('2016-05-2'), interest_rate: 5, term: 2, loan_type: "Credit"}}}
    specify("one model created") { change{Loan.count}.from(0).to(1)}
  end
end
