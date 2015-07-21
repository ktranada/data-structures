require '06_min_max_stack'
require 'spec_helper'

describe MinMaxStack do
  attr_accessor :stack
  before :all do
    @stack = MinMaxStack.new
  end

  describe "initialize" do
    it "should initialize an empty stack" do
      expect(stack.stack.empty?).to be true
    end

    it "should initialize with a nil max value" do
      expect(stack.max).to be(nil)
    end
  end

  describe "push" do
    it "should push values onto the stack" do
      stack.push(5)
      expect(stack.stack.size).to be 1
    end
    it "should have a negative max if max is negative" do
      stack.stack.clear
      stack.push(-5)
      expect(stack.max).to be -5
    end

    it "should calculate max for every new insertion" do
      stack.push(5)
      expect(stack.max).to be 5
      stack.push(10)
      expect(stack.max).to be 10
    end

    it "should set max only to larger values" do
      stack.push 9
      expect(stack.max).to be 10
    end
  end

  describe "pop" do
    it "should remove elements from the stack" do
      expect(stack.stack.size).to be 4
      expect(stack.pop).to eq(9)
      expect(stack.stack.size).to be 3
    end

    it "should change the max appropriately" do
      expect(stack.max).to be 10
      stack.pop
      expect(stack.max).to be 5
    end

    it "should not work on an empty stack" do
      stack.stack.clear
      expect{stack.pop}.to raise_error("Stack is empty")
    end
  end

  describe "max" do
    it "should return nil for an empty stack" do
      expect(stack.max).to be(nil)
    end

    it "should return the most recent max" do
      stack.push(-5)
      expect(stack.max).to be -5
      stack.push(0)
      expect(stack.max).to be 0
      stack.pop
      expect(stack.max).to be -5
    end
  end

  describe "min" do
    it "should return nil for an empty stack" do
      stack.stack.clear
      expect(stack.min).to be(nil)
    end
    it "should return the most recent max" do
      stack.push(-5)
      expect(stack.min).to be -5
      stack.push(0)
      expect(stack.min).to be -5
      stack.pop
      expect(stack.max).to be -5
    end

  end

end
