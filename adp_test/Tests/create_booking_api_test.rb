# Test 3: Test to make a POST request to the “create booking” end point and verify a response indicating that a booking was made that you receive a response indicating that a booking was made.
require 'uri'
require 'net/http'

url = URI('https://restful-booker.herokuapp.com/booking')
customer = {
          'firstname' => 'Jim',
          'lastname' => 'Brown',
          'totalprice' => 111,
          'depositpaid' => true,
          'bookingdates[checkin]' => '2018-01-01',
          'bookingdates[checkout]' => '2019-01-01',
          'additionalneeds' => 'Breakfast'
        }
response = Net::HTTP.post_form(url, customer)
puts response
puts response.body
if response.is_a?(Net::HTTPOK)
    puts ('Booking was succesfuly made')
else
    puts ('Booking error')
end
