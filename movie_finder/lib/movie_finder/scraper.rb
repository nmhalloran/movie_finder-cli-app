class MovieFinder::Scraper
  attr_accessor :zip_code
  zip_code = 02132

  def self.zip_code_scraper(zip_code)
    html = "https://www.fandango.com/02639_movietimes?mode=general&q=02639"
    data =Nokogiri::HTML(open(html))
    binding.pry
  end

end
<h3 class="fd-movie__title.font-sans-serif.font-lg.font-300.uppercase">
                                    <a class="dark" href="https://www.fandango.com/victoriaandabdul_202619/movieoverview">Victoria and Abdul</a>

                                        <a href="https://www.fandango.com/account/joinnow?from=https%3A%2F%2Fwww.fandango.com%2F02639_movietimes?source=web_multiple_addmovie&amp;id=202619&amp;action=addmovie&amp;rating=" class="icon icon-follow-gray fd-movie__follow-icon js-follow"></a>

                                </h3>
