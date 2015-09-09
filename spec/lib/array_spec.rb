# encoding: utf-8
require 'spec_helper'
require 'inactive_support/array'

describe Array do

  describe '#butfirst' do
    it 'returns all elements excluding the first one' do
      expect([].butfirst).to eq []
      expect([1].butfirst).to eq []
      expect([1, 2, 3].butfirst).to eq [2, 3]
      expect([1, 2, 3, 4].butfirst).to eq [2, 3, 4]
    end
  end

  describe '#butlast' do
    it 'returns all elements excluding the last one' do
      expect([].butlast).to eq []
      expect([1].butlast).to eq []
      expect([1, 2, 3].butlast).to eq [1, 2]
      expect([1, 2, 3, 4].butlast).to eq [1, 2, 3]
    end
  end
end
