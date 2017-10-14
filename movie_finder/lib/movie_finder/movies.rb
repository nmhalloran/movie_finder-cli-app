class MovieFinder::Movies
  attr_accessor :title, :starring, :type, :rating, :summary

  def self.create_features
    movies = MovieFinder::Scraper.feature_scraper
    @movie_array = []

    movies.css("div.show").each_with_index do |movie, i|

      show = self.new
      show.title = movie.css('h2').text
      show.starring = movie.css('h3 + p').text.split(", ")[0]
      show.type = movie.css("h2 + p").text.split(" ")[0]
      show.rating = movie.css("h2 + p").text.split(" ")[2]
      show.summary = movie.css("p.cat + p").text
      @movie_array << show unless movie.css('h2').text == ""
    end
    @movie_array
  end

  def self.create_ca
    ca = MovieFinder::Scraper.ca_scraper
    bindind.pry
    show = self.new
    show.title = ca.css('h2').text
    show.starring = ca.css('h3 + p').text.split(", ")[0]
    show.type = ca.css("h2 + p").text.split(" ")[0]
    show.rating = ca.css("h2 + p").text.split(" ")[2]
    show.summary = ca.css("p.cat + p").text
    show
  end

end
