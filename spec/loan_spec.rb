# spec/loan_spec.rb
require 'loan'

RSpec.describe Loan do
  let(:due) { Date.new(2026, 10, 1) }

  describe '.new' do
    it 'raises an ArgumentError when the due date is missing' do
      expect { Loan.new(due_on: nil, returned_on: due) }.to raise_error(ArgumentError, 'Due date is required')
    end

    it 'raises an ArgumentError when the return date is missing' do
      expect { Loan.new(due_on: due, returned_on: nil) }.to raise_error(ArgumentError, 'Return date is required')
    end
  end

  describe '#late?' do
    context 'when returned before the due date' do
      it 'is not late' do
        loan = Loan.new(due_on: due, returned_on: due - 1)
        expect(loan).not_to be_late
      end
    end

    context 'when returned on the due date' do
      it 'is not late' do
        loan = Loan.new(due_on: due, returned_on: due)
        expect(loan).not_to be_late
      end
    end

    context 'when returned after the due date' do
      it 'is late' do
        loan = Loan.new(due_on: due, returned_on: due + 1)
        expect(loan).to be_late
      end
    end
  end

  describe '#days_late' do
    context 'when returned before the due date' do
      it 'is 0' do
        loan = Loan.new(due_on: due, returned_on: due - 2)
        expect(loan.days_late).to eq(0)
      end
    end

    context 'when returned 3 days after the due date' do
      it 'is 3' do
        loan = Loan.new(due_on: due, returned_on: due + 3)
        expect(loan.days_late).to eq(3)
      end
    end
  end

  describe '#fee' do
    context 'when returned on time' do
      it 'is 0' do
        loan = Loan.new(due_on: due, returned_on: due)
        expect(loan.fee).to eq(0)
      end
    end

    context 'when returned 1 day late' do
      it 'is 0.25' do
        loan = Loan.new(due_on: due, returned_on: due + 1)
        expect(loan.fee).to eq(0.25)
      end
    end

    context 'when returned 20 days late' do
      it 'reaches the $5.00 cap exactly' do
        loan = Loan.new(due_on: due, returned_on: due + 20)
        expect(loan.fee).to eq(5.0)
      end
    end

    context 'when returned 21 days late' do
      it 'stays at the $5.00 cap' do
        loan = Loan.new(due_on: due, returned_on: due + 21)
        expect(loan.fee).to eq(5.0)
      end
    end
  end
end
