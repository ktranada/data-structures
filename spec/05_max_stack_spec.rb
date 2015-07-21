require '05_max_stack'
require 'spec_helper'

describe MaxStack do
  attr_accessor :max_stack
  before :all do
    @max_stack = MaxStack.new
  end

  describe "initialize" do
    it "should initialize an empty stack" do
      expect(max_stack.stack.empty?).to be true
    end

    it "should initialize with a nil max value" do
      expect(max_stack.max).to be(nil)
    end
  end

  describe "push" do
    it "should push values onto the stack" do
      max_stack.push(5)
      expect(max_stack.stack.size).to be 1
    end
    it "should have a negative max if max is negative" do
      max_stack.stack.clear
      max_stack.push(-5)
      expect(max_stack.max).to be -5
    end

    it "should calculate max for every new insertion" do
      max_stack.push(5)
      expect(max_stack.max).to be 5
      max_stack.push(10)
      expect(max_stack.max).to be 10
    end

    it "should set max only to larger values" do
      max_stack.push 9
      expect(max_stack.max).to be 10
    end
  end

  describe "pop" do
    it "should remove elements from the stack" do
      expect(max_stack.stack.size).to be 4
      expect(max_stack.pop).to eq([9, 10])
      expect(max_stack.stack.size).to be 3
    end

    it "should change the max appropriately" do
      expect(max_stack.max).to be 10
      max_stack.pop
      expect(max_stack.max).to be 5
    end

    it "should not work on an empty stack" do
      max_stack.stack.clear
      expect{max_stack.pop}.to raise_error("Stack is empty")
    end
  end

  describe "max" do
    it "should return nil for an empty stack" do
      expect(max_stack.max).to be(nil)
    end

    it "should return the most recent max" do
      max_stack.push(-5)
      expect(max_stack.max).to be -5
      max_stack.push(0)
      expect(max_stack.max).to be 0
      max_stack.pop
      expect(max_stack.max).to be -5
    end
  end

end
