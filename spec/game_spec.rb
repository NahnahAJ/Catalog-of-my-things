require_relative 'spec_helper'

describe Game do
  before :each do
    @new_game = Game.new(true, Time.new(2015), '10/02/2022', false)
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
end
