require 'json'
class LabelHandler

  def initialize
    if File.exist?("./label/label.json")
      #Reads from the JSON file and parses it into an object.
      @labels = JSON.parse(File.read("./label/label.json"),{symbolize_names:true})
    else
      #Creates a new label.json file and writes {} as the JSON format.
      File.open("./label/label.json","w+"){|f| f.write("{}") }
      @labels = JSON.parse(File.read("./label/label.json"),{symbolize_names:true})
    end
  end

  def list_labels
    @labels.each_with_index do |label,index|
      puts "#{index+1}) Title: #{label[:title]} | Color: #{label[:color]}"
    end
  end
end

# label = LabelHandler.new
# label.list_labels
