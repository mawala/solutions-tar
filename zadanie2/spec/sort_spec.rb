require 'simplecov'
SimpleCov.start

require 'sort'

RSpec.describe 'sort.rb' do
  describe '#qsort' do
    it 'should be defined' do
      expect { qsort([1, 2, 3]) }.not_to raise_error
    end
    it 'returns the sorted array' do
      expect(qsort([2, 1, 9])).to be_a_kind_of(Array)
      expect(qsort([9, -1, 4])).to eq([-1, 4, 9])
    end
  end
end
