require 'simplecov'
SimpleCov.start

require 'sort'

RSpec.describe 'sort.rb' do
  describe '#qsort' do

    it 'should be defined' do
      expect { qsort([1, 2, 3]) }.not_to raise_error
    end

    context 'with no argument' do
      it { expect { qsort() }.to raise_error(ArgumentError) }
    end

    context 'with no array' do
      it { expect { qsort(1) }.to raise_error(NoMethodError) }
    end

    context 'with empty array' do 
      it { expect(qsort([])).to eq([]) }
    end

    context 'with array' do
      it 'should return the sorted array' do
        expect(qsort([2, 1, 9])).to be_a_kind_of(Array)
        expect(qsort([9.3, -1, 4])).to eq([-1, 4, 9.3])
        expect(qsort(%w[one two three])).to eq(%w[one three two])
      end
    end
  end
end
