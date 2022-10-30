
require 'selenium-webdriver'

class Browser

  caps = Selenium::WebDriver::Chrome::Options.new
  $browser = Selenium::WebDriver.for :chrome, options: caps

  # Naviagtes to the supplied url
  def self.goto(url)
    $browser.navigate.to(url)
  end

end
