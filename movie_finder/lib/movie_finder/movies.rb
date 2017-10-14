class MovieFinder::Movies
  attr_accessor :title, :starring, :type, :rating, :summary, :release_date, :times

  def self.create_features
    movies = MovieFinder::Scraper.feature_scraper
    @movie_array = []

    movies.css("div.show").each do |movie|

      show = self.new
      show.title = movie.css('h2').text.split.map(&:capitalize).join(' ')
      show.starring = movie.css('h3:first-of-type + p').text
      show.type = movie.css("h2 + p").text.capitalize.split(" ")[0]
      show.rating = movie.css("h2 + p").text.split(" ")[2]
      show.summary = movie.css("p.cat +p").text
      show.summary = show.summary.split
      (16..160).step(16) do |n|
          show.summary.insert(n, "\n\t\b") unless n >= show.summary.length
      end
      show.summary = show.summary.join(" ")


      show.times = movie.css("div.left p strong").text
      @movie_array << show unless movie.css('h2').text == ""
    end
    @movie_array
  end

  def self.create_ca
    ca = MovieFinder::Scraper.ca_scraper
    show = self.new
    show.title = ca.css('h1').text.split.map(&:capitalize).join(' ')
    show.starring = ca.css('h3 + p').first.text
    show.type = ca.css("h1 + p").text.capitalize.split(" ")[0]
    show.rating = ca.css("h1 + p").text.split(" ")[2]
    show.summary = ca.css("br + p").text
    show.summary = show.summary.split
    (16..160).step(16) do |n|
        show.summary.insert(n, "\n\t\b") unless n >= show.summary.length
    end
    show.summary = show.summary.join(" ")
    show.release_date = ca.css('h3 + p')[2].text
    show
  end

end
