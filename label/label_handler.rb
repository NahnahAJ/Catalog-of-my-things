require 'json'
require_relative './label'
class LabelHandler
  attr_accessor :labels

  def initialize
    if File.exist?('./label/label.json')
      # Reads from the JSON file and parses it into an object.
    else
      # Creates a new label.json file and writes {} as the JSON format.
      File.write('./label/label.json', '[]')
    end
    @labels = JSON.parse(File.read('./label/label.json'), { symbolize_names: true })
  end

  def list_labels
    @labels.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label[:title]} | Color: #{label[:color]}"
    end
  end

  def add_labels
    puts 'Enter label title.'
    title = gets.chomp
    puts 'Enter label color.'
    color = gets.chomp
    label = Label.new(title, color)
    new_label = label.to_json
    @labels << new_label
    File.write('./label/label.json', JSON[@labels])
    puts 'Label is added successfully.'
  end
end
