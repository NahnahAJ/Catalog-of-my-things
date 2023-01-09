class Item

  attr_accessor :id , :genre , :author , :source , :label , :publish_date, :archived

  def intitalize (id,genre,author,source,label,publish_date,archived)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?()
    uless publish_date > 10
      false
    end
  end

  def move_to_archive()
    if can_be_archived?()
      @archived = true
    else
  end
end
