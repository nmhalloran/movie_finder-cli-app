class MovieFinder::CLI
  def call
    @movies_array = MovieFinder::Movies.create_features
    @movies_array << MovieFinder::Movies.create_ca
    puts "Hello movie lover! Welcome to the Dedham Community Theater!"
    user_input
  end

  def intro
    puts "Today's movies are:"
    puts "1.) #{@movies_array[0].title}, a Drama starring Harry Dean Stanton"
    puts "2.) Victoria and Abdul, a Drama starring Dame Judi Dench"
  end

  def user_input
    intro
    input = ""
    while input != "exit"
      puts "Please press 1 or 2 or 'coming soon' to get more info"
      puts "Type 'start over' to see options or 'exit' to leave program: "
      input = gets.strip

      if input == "1"
        puts "Summary: m"
        puts "Rating"
        puts "Showtimes"
      elsif input == "2"
        puts "Summary of Victoria and Abdul"
        puts "Rating"
        puts "Showtimes"
      elsif input.downcase == "coming soon"
        puts "Summary of Goodby to Christopher Robin"
        puts "Rating"
        puts "Starting Date"
      elsif input.downcase == "start over"
        intro
      elsif input.downcase == "exit"
        puts "Thank you for visiting the Dedham Community Theater!"
      else
        puts "Not an option. Please type 1, 2, or coming soon:"
      end
    end

  end

end
