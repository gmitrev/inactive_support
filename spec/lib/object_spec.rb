require 'spec_helper'
require 'inactive_support/object'

describe Object do

  describe "#ctry" do
    it "works with 1 argument" do
      expect("String".ctry(:downcase)).to eq 'string'
    end

    it "works with multiple arguments" do
      expect("Nurse I spy gypsies run".ctry(:downcase, :reverse)).to eq 'nur seispyg yps i esrun'
    end

    it 'returns nil when called on nil' do
      expect(nil.ctry(:downcase, :upcase)).to eq nil
    end
  end

end
