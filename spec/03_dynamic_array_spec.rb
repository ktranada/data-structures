require "03_dynamic_array"
require 'spec_helper'

RSpec.describe DynamicArray do
  attr_accessor :d_a, :d_a2
  before :all do
    @d_a = DynamicArray.new(8)
  end

  describe "initialize" do
    it "should be of fixed length" do
      expect(d_a.size).to eq 8
    end

    it "should be initialized with nil" do
      expect(d_a.store.store.all? {| el | el.nil? }).to be true
    end

    it "should have 0 elements" do
      expect(d_a.num_elements).to be 0
    end
  end

  describe "push" do
    it "should add element to the end" do
      8.times do |i|
        d_a.push(i)
        expect(d_a[i]).to be i
      end
      expect(d_a.num_elements).to be 8
    end

    it "should resize when array is full" do
      expect(d_a.num_elements == d_a.size).to be true
      d_a.push(9)
      expect(d_a.size).to be 16
      expect(d_a[8]).to be 9
      expect(d_a.num_elements).to be 9
    end
  end

  describe "pop" do
    it "should remove the element from the end" do
      expect(d_a[8]).to be 9
      d_a.pop
      expect(d_a[8]).to be nil
    end

    it "should return the element" do
      expect(d_a.pop).to be 7
      expect(d_a.pop).to be 6
      expect(d_a.pop).to be 5
      expect(d_a.pop).to be 4
      expect(d_a.pop).to be 3
      expect(d_a.pop).to be 2
      expect(d_a.pop).to be 1
      expect(d_a.pop).to be 0
    end

    it "should raise error when empty" do
      expect{d_a.pop}.to raise_error("Empty array")
    end
  end

  before :all do
    @d_a2 = DynamicArray.new(8)
  end
  describe "unshift" do
    it "should add element to the front" do
      7.downto(0) do |i|
        d_a2.unshift(i)
        expect(d_a2[0]).to be i
      end
      expect(d_a2.num_elements).to be 8
    end

    it "should resize when array is full" do
      expect(d_a2.num_elements == d_a2.size).to be true
      d_a2.unshift(9)
      expect(d_a2.size).to be 16
      expect(d_a2[0]).to be 9
      expect(d_a2.num_elements).to be 9
    end
  end

  describe "shift" do
    it "should remove the element from the beginning" do
      expect(d_a2[0]).to be 9
      d_a2.shift

      expect(d_a2[8]).to be nil
      expect(d_a2[7]).to be 7

    end

    it "should return the element" do
      8.times do |i|
        expect(d_a2.shift).to be i
      end
    end

    it "should raise error when empty" do
      expect{d_a2.shift}.to raise_error("Empty array")
    end
  end
end
