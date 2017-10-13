class MovieFinder::Scraper

  def self.theater_scraper
    html = "http://www.dedhamcommunitytheatre.com/"
    data =Nokogiri::HTML(open(html))
  end

end
