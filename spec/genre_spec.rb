require_relative '../Music/genre'
require_relative '../Music/album'

describe Genre do
  before(:each) do
    @genre = Genre.new('Comedy')
  end

  it 'Should return the argument passed to it.' do
    expect(@genre.name).to eql 'Comedy'
  end

  it 'Should allow items to be added' do
    item = MusicAlbum.new('Korra', true, '2020-01-01')
    @genre.add_item(item)
    expect(item.genre).to be @genre
  end
end
