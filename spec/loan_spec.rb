# spec/loan_spec.rb
require 'loan'

RSpec.describe Loan do
  let(:due) { Date.new(2026, 10, 1) }

  describe '.new' do
    it 'raises an ArgumentError when the due date is missing' do
      expect { Loan.new(due_on: nil, returned_on: due) }.to raise_error(ArgumentError, 'Due date is required')
    end

    it 'raises an ArgumentError when the return date is missing'
  end

  describe '#late?' do
    context 'when returned before the due date' do
      it 'is not late'
    end

    context 'when returned on the due date' do
      it 'is not late'
    end

    context 'when returned after the due date' do
      it 'is late'
    end
  end

  describe '#days_late' do
    context 'when returned before the due date' do
      it 'is 0'
    end

    context 'when returned 3 days after the due date' do
      it 'is 3'
    end
  end

  describe '#fee' do
    # Which returns could this get wrong?
  end
end
