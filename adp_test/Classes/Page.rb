class Page

  # Objects for the fields on the page
  @page_objects = {}

  def self.page_objects
    @page_objects
  end

  # Clicks the selenium page element on the page
  def self.click(element, root_element = false)
    root = root_element if root_element
    element = get_elements(element, root).first
    element.click
  end

  # Sets a selenium page element
  def self.set(element, value = false)
    element.send_keys(value)
  end

  # Returns the text of a selenium page element
  def self.get(element, root_element = false)
    value = element.text
    return value
  end

  # Returns a selenium element for the page_object_key provided
  def self.get_elements(page_object_key, root_element = false)
    root = root_element if root_element
    # Get the CSS selector from the page objects
    identifier = page_objects[page_object_key]
    elements = []
    if identifier
      elements = root.find_elements(css: identifier)
    end
    return elements
  end

  # Tests if an element is present
  def self.present?(page_object_key, parent_element = false)
    elements = get_elements(page_object_key, parent_element)
    element_present = false
    element_present = true if elements.count > 0 && elements[0].displayed?
    return element_present
  end

end
