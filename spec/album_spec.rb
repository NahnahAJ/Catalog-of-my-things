require_relative '../Music/genre'
require_relative '../Music/album'

describe MusicAlbum do
  before(:each) do
    @album = MusicAlbum.new('Korra', true, '2000-01-01')
  end

  it 'Should print return the class properties' do
    expect(@album.name).to eql 'Korra'
    expect(@album.on_spotify).to be true
  end

  it 'Should allowed archived' do
    expect(@album.can_be_archived?).to be true
  end

  it 'should return the objects state in hash' do
    genre = Genre.new('Comedy')
    genre.add_item(@album)
    expect(@album.to_hash[:publish_date]).to eql '2000-01-01'
  end
end
