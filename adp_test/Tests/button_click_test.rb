gem 'minitest'
require 'minitest/autorun'

require_relative '../Classes/Browser'
require_relative '../Classes/ButtonClick'

# Test 1: Test to perform button click works
class ButtonClickTest < Minitest::Test

  def test_button_click
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    ButtonClick.click(:dynamic_buttons_challange_1)
    assert_equal('Click all 4 buttons.', ButtonClick.get(:buttonmessage), "Cannot see the 'Click all 4 buttons.' message")
    ButtonClick.click(:start_button)
    ButtonClick.click(:button_one)
    sleep 2
    ButtonClick.click(:button_two)
    sleep 3
    ButtonClick.click(:button_three)
    assert_equal('All Buttons Clicked', ButtonClick.get(:buttonmessage), "Cannot see the 'All Buttons Clicked' message")
  end

end
