gem 'minitest'
require 'minitest/autorun'

require_relative '../Classes/Browser'
require_relative '../Classes/SimpleCalculator'
# Test 2: Tests to perform operations in simple calculator
class SimpleCalculatorTest < Minitest::Test

  # Test to perform plus operation and verify the answer is correct
  def test_simple_calculator_for_plus
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    SimpleCalculator.calculate('2', '3', 'plus')
    assert_equal('5', SimpleCalculator.get(:answer), "Incorrect answer for plus function")
  end

  # Test to perform times operation and verify the answer is correct
  def test_simple_calculator_for_times
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    SimpleCalculator.calculate('2', '3', 'times')
    assert_equal('6', SimpleCalculator.get(:answer), "Incorrect answer for times function")
  end

  # Test to perform minus operation and verify the answer is correct
  def test_simple_calculator_for_minus
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    SimpleCalculator.calculate('2', '3', 'minus')
    assert_equal('-1', SimpleCalculator.get(:answer), "Incorrect answer for minus function")
  end

  # Test to perform divide operation and verify the answer is correct
  def test_simple_calculator_for_divide
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    SimpleCalculator.calculate('2', '3', 'divide')
    assert_equal('0.666667', SimpleCalculator.get(:answer), "Incorrect answer for divide function")
  end

  # Test to perform plus operation with nil value and verify error displayed
  def test_simple_calculator_for_nil
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    SimpleCalculator.calculate('', '3', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when nil value is entered in the first field")

    SimpleCalculator.calculate('2', '', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when nil value is entered in the second field")

    SimpleCalculator.calculate('', '', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when nil value is entered in both fields")
  end

  # Test to perform plus operation with characters and verify error displayed
  def test_simple_calculator_for_characters
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    SimpleCalculator.calculate('text', '3', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when characters are entered in the first field")

    SimpleCalculator.calculate('2', 'text', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when characters are entered in the second field")

    SimpleCalculator.calculate('text', 'text', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when characters are entered in both fields")
  end

  # Test to perform plus operation with symbols and verify error displayed
  def test_simple_calculator_for_symbols
    Browser.goto('https://testpages.herokuapp.com/styled/index.html')
    SimpleCalculator.calculate('@', '3', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when symbols are entered in the first field")

    SimpleCalculator.calculate('2', '&', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when symbols are entered in the second field")

    SimpleCalculator.calculate('+', '=', 'plus')
    assert_equal('ERR', SimpleCalculator.get(:answer), "Error should be displayed when symbols are entered in both fields")
  end
end
