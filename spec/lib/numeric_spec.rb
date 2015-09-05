# encoding: utf-8
require 'spec_helper'
require 'inactive_support/numeric'

describe Numeric do

  describe '#precision' do

    it 'behaves exactly like Float#round when invoked with no arguments', :brute do
      1_000_000.times do
        n = rand(1.0..100.0)
        puts n if n.precision != n.round
        expect(n.precision).to eq n.round
      end
    end

    it 'behaves exactly like Float#round when invoked with no arguments' do
      1_000.times do
        n = rand(1.0..100.0)
        puts n if n.precision != n.round
        expect(n.precision).to eq n.round
      end
    end

    describe 'reality checks' do

      it 'case#1' do
        expect(3.904605.precision(0)).to eq 4
        expect(3.904605.precision(1)).to eq 3.9
        expect(3.904605.precision(2)).to eq 3.91
        expect(3.904605.precision(3)).to eq 3.905
        expect(3.904605.precision(4)).to eq 3.9046
      end

      it 'case#2' do
        expect(37.9945.precision(0)).to eq 38
        expect(37.9945.precision(1)).to eq 38
        expect(37.9945.precision(2)).to eq 38
      end

      it 'case#3' do
        expect(37.9944.precision(0)).to eq 38
        expect(37.9944.precision(1)).to eq 38
        expect(37.9944.precision(2)).to eq 37.99
      end

    end

  end
end
