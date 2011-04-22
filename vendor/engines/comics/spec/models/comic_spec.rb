require 'spec_helper'

describe Comic do

  def reset_comic(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @comic.destroy! if @comic
    @comic = Comic.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_comic
  end

  context "validations" do
    
    it "rejects empty title" do
      Comic.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_comic
      Comic.new(@valid_attributes).should_not be_valid
    end
    
  end

end