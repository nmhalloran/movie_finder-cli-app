class MovieFinder::Movies
  attr_accessor :title, :starring, :type, :rating, :summary

  def self.make_features
    movies = MovieFinder::Scraper.theater_scraper
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

end
