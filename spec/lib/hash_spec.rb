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

      expect(initial.delete_blank).to eq expected
    end

    it 'deletes empty strings' do
      initial = {
        id: 1,
        name: ""
      }

      expected = {
        id: 1
      }

      expect(initial.delete_blank).to eq expected
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

      expect(initial.delete_blank).to eq expected
    end

    it 'deletes empty arrays' do
      initial = {
        id: 1,
        name: []
      }

      expected = {
        id: 1
      }

      expect(initial.delete_blank).to eq expected

    end
    it 'deletes empty hashes' do
      initial = {
        id: 1,
        name: {}
      }

      expected = {
        id: 1
      }

      expect(initial.delete_blank).to eq expected

    end

  end

  describe "#deep_delete_blank" do

    it 'deletes nils' do
      initial = {
        id: 1,
        name: {
          first: nil,
          middle: "Peter"
        }
      }

      expected = {
        id: 1,
        name: {
          middle: "Peter"
        }
      }

      expect(initial.deep_delete_blank).to eq expected
    end

    it 'deletes empty strings' do
      initial = {
        id: 1,
        name: {
          first: "",
          middle: "Peter"
        }
      }

      expected = {
        id: 1,
        name: {
          middle: "Peter"
        }
      }

      expect(initial.deep_delete_blank).to eq expected
    end

    it 'preserves false values' do
      initial = {
        id: 1,
        name: {
          first: false,
          middle: "Peter"
        }
      }

      expected = {
        id: 1,
        name: {
          first: false,
          middle: "Peter"
        }
      }

      expect(initial.deep_delete_blank).to eq expected
    end

    it 'deletes empty arrays' do
      initial = {
        id: 1,
        name: {
          addresses: [],
          middle: "Peter"
        }
      }

      expected = {
        id: 1,
        name: {
          middle: "Peter"
        }
      }

      expect(initial.deep_delete_blank).to eq expected

    end
    it 'deletes empty hashes' do
      initial = {
        id: 1,
        name: {
          children: {},
          middle: "Peter"
        }
      }

      expected = {
        id: 1,
        name: {
          middle: "Peter"
        }
      }

      expect(initial.deep_delete_blank).to eq expected
    end

  end

end
