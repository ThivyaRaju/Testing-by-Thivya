require_relative 'Page'

class ButtonClick < Page

  @page_objects = Page.page_objects.merge({
                                              dynamic_buttons_challange_1: 'a#button01',
                                              start_button: 'button#button00',
                                              button_one: 'button#button01',
                                              button_two: 'button#button02',
                                              button_three: 'button#button03',
                                              buttonmessage: 'p#buttonmessage'
                                          })
end
