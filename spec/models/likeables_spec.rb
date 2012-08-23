require 'spec_helper'

describe Likeable do
  before(:each) do
    @attr = {
      :name => "Example Like"
    }
  end

  it "should create a new instance given a valid name" do
    Likeable.create!(@attr)
  end

  it "should require a name" do
    no_name_like = Likeable.new(@attr.merge(:name => ""))
    no_name_like.should_not be_valid
  end

  it "should reject duplicate likeables" do
    Likeable.create!(@attr)
    duplicate_likeable = Likeable.new(@attr)
    duplicate_likeable.should_not be_valid
  end
end
