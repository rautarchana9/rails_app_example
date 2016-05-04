class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new
    if @loan.valid?
      @loan.save
      thread = Thread.new{@loan.generate_schedule}
      at_exit {thread.join}
      render 'create'
    else
      render 'new'
    end
  end
end
