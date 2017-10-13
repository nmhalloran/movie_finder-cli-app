class MovieFinder::Movies
  attr_accessor :title, :starring, :type, :rating, :summary

  def self.make_movie_info
    movies = MovieFinder::Scraper.theater_scraper

    movies.css("div.show").each_with_index do |movie, i|

      movie_1 = self.new
      movie_1.title = movie.css('h2').text
      movie_1.starring = movie.css('h3 + p').text.split(", ")[0] + " and " + movie.css('h3 + p').text.split(", ")[1]
      movie_1.type = movie.css("h2 + p").text.split(" ")[0]
      movie_1.rating = movie.css("h2 + p").text.split(" ")[2]
      movie_1.summary = movie.css("p.cat + p").text
      binding.pry
    end
  end

end
