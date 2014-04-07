require 'spec_helper'
require 'inactive_support/numeric'

describe Numeric do

  describe "#precision" do

    it 'behaves exactly like Float#round when invoked with no arguments', :brute do
      1_000_000.times do
        n = rand(1.0..100.0)
        puts n if n.precision != n.round
        n.precision.should eq n.round
      end
    end

    it 'behaves exactly like Float#round when invoked with no arguments' do
      1_000.times do
        n = rand(1.0..100.0)
        puts n if n.precision != n.round
        n.precision.should eq n.round
      end
    end

    describe "reality checks" do
      
      it "case#1" do
        3.904605.precision(0).should eq 4
        3.904605.precision(1).should eq 3.9
        3.904605.precision(2).should eq 3.91
        3.904605.precision(3).should eq 3.905
        3.904605.precision(4).should eq 3.9046
      end

      it "case#2" do
        37.9945.precision(0).should eq 38
        37.9945.precision(1).should eq 38
        37.9945.precision(2).should eq 38
      end

      it "case#3" do
        37.9944.precision(0).should eq 38
        37.9944.precision(1).should eq 38
        37.9944.precision(2).should eq 37.99
      end

    end

  end
end
