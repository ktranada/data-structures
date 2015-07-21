require "00_int_hash_set"
require 'spec_helper'

RSpec.describe IntHashSet do
  attr_accessor :ihs
  before :all do
    @ihs = IntHashSet.new
  end

  describe 'initialize' do
    it  "has 0 elements" do
      ihs.num_elements.should == 0
    end

    it "has 8 buckets" do
      ihs.buckets.length.should == 8
    end
  end


  describe "insert" do
    it "inserts 7 elements" do
      7.times do |i|
        ihs.insert(i)
      end
      ihs.num_elements.should be 7
    end
  end

  describe "include" do
    it "checks for values" do
      expect(ihs.include?(1)).to be true
      expect(ihs.include?(10)).to be false
      expect(ihs.include? 5 ).to be true
    end
  end

  describe "delete" do
    it "removes 1 element" do
      expect(ihs.remove(5)).to be true
      expect(ihs.include? 5 ).to be false
      expect(ihs.remove 5).to be false
    end

    it "should have 6 elements" do
      expect(ihs.num_elements).to be 6
    end
  end

  describe "resize" do
    it "should resize if num of elements > num of buckets" do
      ihs.insert 12
      ihs.insert 14
      expect(ihs.num_elements).to be 8
      ihs.insert 15
      expect(ihs.buckets.length).to be 16
      expect(ihs.num_elements).to be 9
    end
  end
end
