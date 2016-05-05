class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.valid?
      @loan.save
      thread = Thread.new{@loan.generate_schedule}
      at_exit {thread.join}
      render 'create'
    else
      render 'new'
    end
  end

  private 
  def loan_params
    params.permit(:borrower_name, :loan_number,:principal_loan_amount, :closing_date, :first_payment_date, :interest_rate, :term, :loan_type )
  end
end
