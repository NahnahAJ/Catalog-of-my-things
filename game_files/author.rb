require_relative '../item'
# Create an Author class with an association to the Item class (in a separate .rb file).
class Author
  attr_accessor :items, :id, :first_name, :last_name

  # All Author class properties visible in the diagram should be defined and set up in the constructor method.
  def initialize(first_name, last_name)
    @id = Random.rand(1..100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  #   add_item method in the Author class
  def add_item(new_item)
    items << new_item
    new_item.add_author(self)
  end

  def to_json(*args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(*args)
  end
end
