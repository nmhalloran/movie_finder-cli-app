class MovieFinder::CLI
  attr_accessor :zip_code
  @zip_code = 02132
  def call
    MovieFinder::Scraper.zip_code_scraper(@zip_code)
    puts "Hello movie lover!"
  end

end
