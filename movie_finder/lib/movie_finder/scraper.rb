class MovieFinder::Scraper

  def self.feature_scraper
    html = "http://www.dedhamcommunitytheatre.com/"
    data = Nokogiri::HTML(open(html))
    data
  end

  def self.ca_scraper
    data = self.feature_scraper
    ca_html = data.css("div.show p.soon + a")
    ca_data = ca_html.collect do |html|
      new_url = html[attributes = 'href']
      Nokogiri::HTML(open(new_url))
    end
  end

end
