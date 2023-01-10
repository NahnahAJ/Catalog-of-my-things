class Item
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive()
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?()
    Time.now.year - @publish_date > 10
  end
end
