require 'loan'
require 'date'

RSpec.describe Loan do
  describe '.new' do
    context 'when given non-nil due date and return date' do
      it 'creates a loan' do
        due = Date.new(2026, 10, 7)
        returned = Date.new(2026, 10, 5)

        loan = Loan.new(due_on: due, returned_on: returned)

        expect(loan.due_on).to eq(Date.new(2026, 10, 7))
        expect(loan.returned_on).to eq(Date.new(2026, 10, 5))
      end

    end
    context 'when given nil due date' do
      it 'raise ArgumentError' do
        due = nil
        returned = Date.new(2026, 10, 5)

        expect { Loan.new(due_on: due, returned_on: returned) }.to raise_error(ArgumentError, 'Due date is required')
      end

    end
    context 'when given nil return date' do
      it 'raises ArgumentError' do
        due = Date.new(2026, 10, 7)
        returned = nil

        expect { Loan.new(due_on: due, returned_on: returned) }.to raise_error(ArgumentError, 'Return date is required')
      end

    end
  end

  describe '#late?' do
    context 'when returned before due date' do
      it 'is not late' do
        returned = Date.new(2026, 10, 5)
        due = Date.new(2026, 10, 7)

        loan = Loan.new(due_on: due, returned_on: returned)

        expect(loan.late?).to eq(false)
      end
    end
    context 'when returned on due date' do
      it 'is not late' do
        returned = Date.new(2026, 10, 5)
        due = Date.new(2026, 10, 5)

        loan = Loan.new(due_on: due, returned_on: returned)

        expect(loan.late?).to eq(false)
      end
    end
    context 'when returned after due date' do
      it 'is late' do
        returned = Date.new(2026, 10, 7)
        due = Date.new(2026, 10, 5)

        loan = Loan.new(due_on: due, returned_on: returned)

        expect(loan.late?).to eq(true)
      end

    end
  end

  describe '#days_late' do

  end

  describe '#fee' do

  end
end
