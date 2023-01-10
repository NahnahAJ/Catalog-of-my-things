require_relative '../label/label'
describe Label do
  before :all do
    @label = Label.new('Classic', 'Burgendi')
    @label2 = Label.new('Aesthetic', 'Purple')
  end
  context '#Given parameters' do
    it 'should intatiate an object of Label' do
      expect(@label).to be_instance_of(Label)
      expect(@label2).to be_instance_of(Label)
    end

    it 'Should have properties passed in the parameters' do
      expect(@label.title).to eql('Classic')
      expect(@label2.title).to eql('Aesthetic')
      expect(@label.color).to eql('Burgendi')
      expect(@label2.color).to eql('Purple')
    end

    it 'Should return the JSON format of the object' do
      expect(@label.to_json).to eql({ 'id' => @label.id, 'title' => @label.title, 'color' => @label.color })
      expect(@label2.to_json).to eql({ 'id' => @label2.id, 'title' => @label2.title, 'color' => @label2.color })
    end
  end
end
