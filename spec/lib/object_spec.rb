require 'spec_helper'

describe Object do

  describe "#ctry" do
    it "works with 1 argument" do
      "String".ctry(:downcase).should eq 'string'
    end

    it "works with multiple arguments" do
      "My_string".ctry(:downcase, :dasherize).should eq 'my-string'
    end

    it 'returns nil when called on nil' do
      nil.ctry(:downcase, :upcase).should eq nil
    end
  end

end
