require 'spec_helper'

describe "Bots" do

  before :each do
    (1..5).each do
      FactoryGirl.create(:bot)
    end
  end

  it "should add and start bots" do
    Bots::Application.add_bot(2)
    Bots::Application.add_bot(4)
    sleep 2

    running_bots = Bots::Application.running_bots
    running_bots.size.should == 2

    running_bots.each do |bot|
      if bot.id == 2
        bot.name.should == "bot_2"
        bot.alive?.should be_true
      end

      if bot.id == 4
        bot.name.should == "bot_4"
        bot.alive?.should be_true
      end
    end
  end

  it "should remove bots" do
    Bots::Application.add_bot(2)
    Bots::Application.add_bot(4)
    sleep 2

    running_bots = Bots::Application.running_bots
    running_bots.size.should == 2

    first_bot = running_bots.first
    first_bot.alive?.should be_true

    Bots::Application.remove_bot(2)
    sleep 2

    running_bots = Bots::Application.running_bots
    running_bots.size.should == 1

    first_bot.alive?.should be_false
  end

end