require 'simplecov'
SimpleCov.start

require 'find'

RSpec.describe 'find.rb' do
  describe '#find' do
    it 'should be defined' do
      expect { find(2, [1, 2, 3]) }.not_to raise_error
    end
    it 'should get the correct number of arguments' do
      expect { find(2) }.to raise_error(ArgumentError)
      expect { find(1, 2, 3) }.to raise_error(ArgumentError)
    end
    it 'should get the correct arguments' do
      expect { find(2, 3) }.to raise_error(NoMethodError)
      expect { find([1, 2, 3], 3) }.to raise_error(NoMethodError)
    end
    it 'returns the correct index' do
      expect(find(3, [3, 2, 1])).to be_a_kind_of Fixnum
      expect(find(4.5, [2, 5.2, 9, 4.5, 3.8, 1])).to eq(3)
      expect(find('two', %w(zero two one three))).to eq(1)
    end
    it 'returns the correct message' do
      expect(find(2, [1, 3, 4, 5])).to be_a_kind_of String
      expect(find(3, [])).to eq('not found')
    end
  end
  describe '#compare' do
    it 'should be defined' do
      expect { compare(1, 2) }.not_to raise_error
    end
    it 'should get the correct number of arguments' do
      expect { compare(1) }.to raise_error(ArgumentError)
      expect { compare(1, 2, 3) }.to raise_error(ArgumentError)
    end
    it 'returns the correct result' do
      expect(compare(1, 1)).to be_a_kind_of Fixnum
      expect(compare('name', 'name')).to eq(0)
      expect(compare(1.2, 2.5)).to eq(-1)
      expect(compare(7, 0)).to eq(1)
    end
  end
  describe '#find_binary' do
    it 'should be defined' do
      expect { find_binary(2, [1, 2, 3, 4, 5]) }.not_to raise_error
    end
    it 'should get the correct arguments' do
      expect { find_binary(1, 3.45) }.to raise_error(NoMethodError)
      expect { find_binary([-1, 2.5], 8) }.to raise_error(NoMethodError)
    end
    it 'returns the correct index' do
      expect(find_binary(1, [1, 2, 3])).to be_a_kind_of Fixnum
      expect(find_binary(4.8, [1, 3.25, 4.1, 4.8, 8, 17])).to eq(3)
      expect(find_binary('two', %w(one three two zero))).to eq(2)
    end
    it 'returns the correct message when not found the key' do
      expect(find_binary(2, [1, 3, 4, 5])).to be_a_kind_of String
      expect(find_binary(3, [])).to eq('not found')
    end
    it 'returns the correct message when the array is not sorted' do
      expect(find_binary(2, [1, 4, 3, 5])).to be_a_kind_of String
      expect(find_binary(3, [3, 2.3, 5.1, -1])).to eq('not sorted')
    end
  end
end
