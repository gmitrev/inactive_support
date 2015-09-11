# encoding: utf-8
require 'spec_helper'
require 'inactive_support/object'

describe Object do

  describe '#ctry' do
    it 'works with 1 argument' do
      expect('String'.ctry(:downcase)).to eq 'string'
    end

    it 'works with multiple arguments' do
      expect('Nurse I spy gypsies run'.ctry(:downcase, :reverse)).to eq 'nur seispyg yps i esrun'
    end

    it 'returns nil when called on nil' do
      expect(nil.ctry(:downcase, :upcase)).to eq nil
    end
  end

  describe '#blank' do
    it 'works with arrays' do
      expect([].blank?).to be true
      expect([1].blank?).to be false
    end

    it 'works with hashes' do
      expect({}.blank?).to be true
      expect({ name: 'Kip' }.blank?).to be false
    end

    it 'works with strings' do
      blank = [
        '',
        ' ',
        '   ',
        "\t",
        "\r",
        "\n"
      ]

      not_blank = [
        ' a ',
        'string'
      ]

      blank.each do |string|
        expect(string.blank?).to be true
      end

      not_blank.each do |string|
        expect(string.blank?).to be false
      end
    end
  end

end
