class MovieFinder::CLI
  def call
    @features = MovieFinder::Movies.create_features
    @coming_attractions = MovieFinder::Movies.create_ca
    puts "Hello movie lover! Welcome to the Dedham Community Theater!"
    user_input
  end

  def intro
    puts "Today's movies are:"
    @features.each do |feature|
      puts "\t1.) #{feature.title}, a #{feature.type}"
      puts "\tStarring: #{feature.starring}"
    end
  end

  def user_input
    intro
    input = ""
    while input != "exit"
      puts "Please press 1 or 2 or 'coming soon' to get more info"
      puts "Type 'start over' to see options or 'exit' to leave program: "
      input = gets.strip

      if input == "1"
        puts "Summary of #{@features[0].title}:"
        puts "#{@features[0].summary}"
        puts "Rating: #{@features[0].rating}"
        puts "Showtimes: #{@features[0].times}"
      elsif input == "2"
        puts "Summary of #{@features[1].title}:"
        puts "#{@features[1].summary}"
        puts "Rating: #{@features[1].rating}"
        puts "Showtimes: #{@features[1].times}"
      elsif input.downcase == "coming soon"
        puts "\t1.) #{@coming_attractions.title}, a #{@coming_attractions.type}"
        puts "\tStarring: #{@coming_attractions.starring}"
        puts "Summary of #{@coming_attractions.title}:"
        puts "#{@coming_attractions.summary}"
        puts "Rating: #{@coming_attractions.rating}"
        puts "Showtimes: #{@coming_attractions.times}"
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
