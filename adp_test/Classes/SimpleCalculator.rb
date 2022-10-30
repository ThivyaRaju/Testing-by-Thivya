require_relative 'Page'

class SimpleCalculator < Page

  @page_objects = Page.page_objects.merge({
                                              calculator: 'a#calculatetest',
                                              number_1: 'input#number1',
                                              number_2: 'input#number2',
                                              function: 'select#function',
                                              function_options: 'select#function option',
                                              calculate_button: 'input#calculate',
                                              answer: 'span#answer'
                                          })

 # Function to perform calculator operations
  def self.calculate(num1, num2, function)
    if function == 'plus'
      f = 0
    elsif function == 'times'
      f = 1
    elsif function == 'minus'
      f = 2
    elsif function == 'divide'
      f = 3
    end

    click(:calculator) if present?(:calculator)
    set(:number_1, num1)
    set(:number_2, num2)
    click(:function)
    function_options = get_elements(:function_options)
    click(function_options[f])
    click(:calculate_button)
  end

end
