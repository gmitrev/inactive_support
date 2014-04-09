require 'spec_helper'
require 'inactive_support/hash/delete_blank'

describe Hash do

  describe "#delete_blank" do

    it 'deletes nils' do
      initial = {
        id: 1,
        name: nil
      }

      expected = {
        id: 1
      }

      initial.delete_blank.should eq expected
    end

    it 'deletes empty strings' do
      initial = {
        id: 1,
        name: ""
      }

      expected = {
        id: 1
      }

      initial.delete_blank.should eq expected
    end

    it 'preserves false values' do
      initial = {
        id: 1,
        name: false
      }

      expected = {
        id: 1,
        name: false
      }

      initial.delete_blank.should eq expected
    end

    it 'deletes empty arrays' do
      initial = {
        id: 1,
        name: []
      }

      expected = {
        id: 1
      }

      initial.delete_blank.should eq expected

    end
    it 'deletes empty hashes' do
      initial = {
        id: 1,
        name: {}
      }

      expected = {
        id: 1
      }

      initial.delete_blank.should eq expected

    end

  end

end
