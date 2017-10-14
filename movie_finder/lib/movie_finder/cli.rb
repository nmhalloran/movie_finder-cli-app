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
      puts "\t1.) #{feature.title}: #{feature.type}"
      puts "\t    Starring: #{feature.starring}"
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
        puts "\t#{@features[0].summary}"
        puts "\tRATING: #{@features[0].rating}"
        puts "\tSHOWTIMES: #{@features[0].times}"
      elsif input == "2"
        puts "Summary of #{@features[1].title}:"
        puts "\t#{@features[1].summary}"
        puts "\tRATING: #{@features[1].rating}"
        puts "\tSHOWTIMES: #{@features[1].times}"
      elsif input.downcase == "coming soon"
        puts "COMING ATTRACTION"
        puts "-----------------"
        puts ""
        puts "#{@coming_attractions.title}, a #{@coming_attractions.type}"
        puts "    Starring: #{@coming_attractions.starring}"
        puts "Summary of #{@coming_attractions.title}:"
        puts "\t#{@coming_attractions.summary}"
        puts "RATING: #{@coming_attractions.rating}"
        puts "RELEASE DATE: #{@coming_attractions.release_date}"

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
