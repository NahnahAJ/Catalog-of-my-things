class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def intitalize(publish_date, archived)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
    @genre = []
    @author = []
    @source = []
    @label = []
  end

  def add_genre(genre)
    @genre << genre
  end

  def add_author(author)
    @author << author
  end

  def add_source(source)
    @source << source
  end

  def add_label(label)
    @label << label
  end

  def can_be_archived?()
    Time.now.year - @publish_date > 10
  end

  def move_to_archive()
    return unless can_be_archived?

    @archived = true
  end
end
