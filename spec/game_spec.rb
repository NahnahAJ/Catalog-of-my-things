require_relative 'spec_helper'

describe Game do
  before :each do
    @new_game = Game.new(true, Time.new(2015))
  end

  it 'should be an instance of Game' do
    expect(@new_game).to be_an_instance_of(Game)
  end

  it 'multiplayer mode is set up correctly' do
    expect(@new_game.multiplayer).to eql(true)
  end

  it 'last played mode is set correctly' do
    expect(@new_game.last_played_at).to eql(Time.new(2015))
  end

  # it "should inherit from the Item class" do
  #   expect(@new_game).to be_an_instance_of(Item)
  # end
  # it "can_be_archived? should return true if more than 2 years have passed since last_played_at" do
  #   allow(Time).to receive(:now).and_return(Time.new(2022, 8, 8))
  #   expect(@new_game.can_be_archived?).to eq(true)
  # end

  # it "can_be_archived? should return false if less than 2 years have passed since last_played_at" do
  #   allow(Time).to receive(:now).and_return(Time.new(2022, 1, 8))
  #   expect(@new_game.can_be_archived?).to eq(false)
  # end
end
