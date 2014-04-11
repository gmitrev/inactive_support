require 'spec_helper'
require 'inactive_support/object'

describe Object do

  describe "#ctry" do
    it "works with 1 argument" do
      "String".ctry(:downcase).should eq 'string'
    end

    it "works with multiple arguments" do
      "Nurse I spy gypsies run".ctry(:downcase, :reverse).should eq 'nur seispyg yps i esrun'
    end

    it 'returns nil when called on nil' do
      nil.ctry(:downcase, :upcase).should eq nil
    end
  end

end
