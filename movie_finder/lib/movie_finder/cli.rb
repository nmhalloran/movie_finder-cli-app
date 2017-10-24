class MovieFinder::CLI
  def call
    @features = MovieFinder::Movies.create_features
    @coming_attractions = MovieFinder::Movies.create_ca
    puts "Hello movie lover! Welcome to the Dedham Community Theater!"
    user_input
  end

  def intro
    puts "Today's movies are:"
    @features.each_with_index do |feature, i|
      puts "\t#{i+1}.) #{feature.title}: #{feature.type}"
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
        puts "COMING ATTRACTIONS"
        puts "-----------------"
        puts ""
        @coming_attractions.each.with_index(1) do |ca, i|
          puts "Title: #{ca.title}, a #{ca.type}"
          puts "Starring: #{ca.starring}"
          puts "Summary: #{ca.summary}"
          puts "RATING: #{ca.rating}"
          puts "RELEASE DATE: #{ca.release_date}"
          if ca.times
            puts "SHOWTIMES: #{ca.times}"
          end
          if @coming_attractions.size > i
            puts "Please hit enter to see the next coming attraction!"
            gets
          end
        end

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
