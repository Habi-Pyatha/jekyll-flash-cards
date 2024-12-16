class AddData
  require "yaml"
  def self.add_data(category)
    file_path= "_data/flashcards.yml"
    data = File.exist?(file_path) ? YAML.load_file(file_path) : {}
    data[category] ||= []

    puts "Question: "
    question = gets.chomp
    puts "Answer:"
    answer = gets.chomp

    puts "#{category}:\n\t- question: #{question}\n\t  answer: #{answer}"
    data[category] << {"question"=>question, "answer"=>answer}
    File.open(file_path,"w"){|file| file.write(data.to_yaml)}
    puts "Added question to #{category} successfully!"

  end

  def self.open
    file_path= "_data/flashcards.yml"
    if File.exist?(file_path)
      data = YAML.load_file(file_path)
      puts data["ruby"]
    end
  end
end

# AddData.add_data("ruby")
AddData.add_data("javascript")