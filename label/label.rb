class Label

  attr_accessor :title , :color , :items
  attr_reader :id

  def initialize(title,color)
    @id = Random.rand(1...10000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
