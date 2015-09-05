require 'spec_helper'
require 'inactive_support/enumerable'

describe Enumerable do
  let(:simple_man) { Struct.new(:name, :age) }
  let(:mitko)  { simple_man.new('Mitko', 10) }
  let(:goshko) { simple_man.new('Goshko', 11) }
  let(:krasi)  { simple_man.new('Krasi', 13) }
  let(:dedo)   { simple_man.new('Dedo', 15) }

  describe '.consecutive_by' do
    it 'partitions lists by consecutive attribute' do
      simple_people = [mitko, goshko, krasi, dedo]

      expect(simple_people.consecutive_by(&:age)).to eq [[mitko, goshko], [krasi], [dedo]]
      expect(simple_people.consecutive_by(&:age)).to eq [[mitko, goshko], [krasi], [dedo]]
    end

    it 'sorts by the given method before partitioning' do
      simple_people = [goshko, krasi, dedo, mitko]

      expect(simple_people.consecutive_by(&:age)).to eq [[mitko, goshko], [krasi], [dedo]]
    end

    it 'works on bare arrays' do
      ary = [1, 2, 3, 5, 7, 8, 11, 12]

      expect(ary.consecutive_by(&:identity)).to eq [[1, 2, 3], [5], [7, 8], [11, 12]]
    end

    describe 'with letters somewhere in the number' do

      it 'works if the letter is in the beginning' do
        ary = %w(A1 A2 A3 A5 A6)
        expected = [%w(A1 A2 A3), %w(A5 A6)]

        expect(ary.consecutive_by(&:identity)).to eq expected
      end

      it 'works if the letter is in the middle' do
        ary = %w(12A12 12A13 12A14 12A16 12A17)
        expected = [%w(12A12 12A13 12A14), %w(12A16 12A17)]

        expect(ary.consecutive_by(&:identity)).to eq expected
      end

      it 'differentiates letters' do
        ary = %w(A1 B2 A3 A5 A6)
        expected = [%w(A1), %w(A3), %w(A5 A6), %w(B2)]

        expect(ary.consecutive_by(&:identity)).to eq expected
      end

    end

  end

  describe '.consecutive?' do

    it 'returns true if the objects are consecutive by the given key' do
      consecutive_people = [mitko, goshko]
      non_consecutive_people = [mitko, goshko, krasi]

      expect(consecutive_people.consecutive?(&:age)).to be true

      expect(non_consecutive_people.consecutive?(&:age)).to be false
    end

    it 'uses identity on the objects if no key is given' do
      expect([1, 2, 3, 4].consecutive?).to be true
      expect([1, 2, 3, 5].consecutive?).to be false
      expect([2, 1, 3, 4].consecutive?).to be false
      expect([].consecutive?).to be false
    end

  end

end
