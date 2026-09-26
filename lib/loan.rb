# lib/loan.rb
require 'date'

# A library loan.
#
# - A loan needs a due date and a return date. Missing either raises an
#   ArgumentError that says which one.
# - A loan is late if the book was returned after its due date. A book
#   returned on or before its due date is not late.
# - days_late is the number of days after the due date, or 0 if the book was
#   returned on time.
# - The fee is $0.25 for each day late, but never more than $5.00.
class Loan
  DAILY_FEE = 0.25
  MAX_FEE = 5.0

  attr_reader :due_on, :returned_on

  def initialize(due_on:, returned_on:)
    raise ArgumentError, 'Due date is required' if due_on.nil?
    raise ArgumentError, 'Return date is required' if returned_on.nil?

    @due_on = due_on
    @returned_on = returned_on
  end

  def late?
    returned_on >= due_on
  end

  def days_late
    [(returned_on - due_on).to_i, 0].max
  end

  def fee
    [days_late * DAILY_FEE, MAX_FEE].min
  end
end
