class MovieFinder::Scraper

  def self.feature_scraper
    html = "http://www.dedhamcommunitytheatre.com/"
    data = Nokogiri::HTML(open(html))
    data
  end

  def self.ca_scraper
    data = self.feature_scraper
    ca_html = data.css("div.show p.soon + a").attribute('href').value
    ca_data = Nokogiri::HTML(open(ca_html))
  end

end
