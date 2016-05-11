class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.valid?
      @loan.save
      schedule = @loan.generate_schedule
      session[:schedule] = schedule.object_id
      Thread.new{@loan.update_progress}
      redirect_to :progress_loans
    else
      render 'new'
    end
  end

  def progress
    Thread.list.each do |thread| 
      @progress = thread['progress'] 
    end
    unless @progress
      @schedule = ObjectSpace._id2ref(session[:schedule])
      render 'schedule'
    end
  end

  private 
  def loan_params
    params.require(:loan).permit(:borrower_name, :loan_number,:principal_loan_amount, :closing_date, :first_payment_date, :interest_rate, :term, :loan_type )
  end
end
