require "02_static_array"
require 'spec_helper'

RSpec.describe StaticArray do
  attr_accessor :static_a
  before :all do
    @static_a = StaticArray.new(8)
  end

  describe "initialize" do
    it "should be of fixed length" do
      expect(static_a.store.length).to eq 8
    end

    it "should be initialized with nil" do
      expect(static_a.store.all? {| el | el.nil? }).to be true
    end
  end

  describe "check bounds" do
    it "should permit proper indexing" do
      expect(static_a.check_bounds 5).to be true
      expect(static_a.check_bounds 7).to be true
    end

    it "should disallow inproper indexing" do
      expect(static_a.check_bounds 9).to be false
      expect(static_a.check_bounds -1).to be false
    end
  end

  describe "setting elements" do
    it "should place elements at indexes within the array" do
      expect(static_a[0] = 1).to be 1
      expect(static_a[7] = 5).to be 5
    end
  end

  describe "getting elements" do
    it "should retrieve element values at specified indexes" do
      expect(static_a[0]).to be 1
      expect(static_a[7]).to be 5
      expect(static_a[1]).to be nil

    end
  end

end
