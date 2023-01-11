require_relative 'spec_helper'

describe Author do
  before :each do
    @new_author = Author.new(1, 'John', 'Doe')
  end

  it 'should be an instance of Author' do
    expect(@new_author).to be_an_instance_of(Author)
  end

  it 'should have an id' do
    expect(@new_author.id).to be_an(Integer)
  end

  it 'should have a first name' do
    expect(@new_author.first_name).to be_a(String)
  end

  it 'should have a last name' do
    expect(@new_author.last_name).to be_a(String)
  end

  it 'should have an empty array of items' do
    expect(@new_author.items).to be_an(Array)
    expect(@new_author.items).to be_empty
  end

  it 'should be able to add an item' do
    new_item = Item.new('2020-01-01', false)
    @new_author.add_item(new_item)
    expect(@new_author.items).to include(new_item)
  end

  it 'should be able to add multiple items' do
    new_item = Item.new('2020-01-01', false)
    new_item2 = Item.new('2020-01-01', false)
    @new_author.add_item(new_item)
    @new_author.add_item(new_item2)
    expect(@new_author.items).to include(new_item)
    expect(@new_author.items).to include(new_item2)
  end
end
