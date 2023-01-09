require_relative '../item.rb'
class Book < Item
  attr_accessor :publisher , :cover_state

  def intitalize(publisher,cover_state,publish_date)
    super(publish_date,false)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end


end
