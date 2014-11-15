require 'rails_helper'

describe Event do
 it "has a valid factory" do
    FactoryGirl.build(:event).should be_valid 
 end 
 
 it "is invalid without a name" do
   FactoryGirl.build(:event, title: nil).should_not be_valid
 end 
end
