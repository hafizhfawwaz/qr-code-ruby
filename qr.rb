# Write your solution here!

# bundle install

require "rqrcode"

puts "Hello! Which QR Code do you need today?"
  
puts "1. URLs"
puts "2. Join Wi-Fi NEtwork"
puts "3. Send A Text"
  
puts "Press 4 to exit program"
puts "-" * 50
user_selection = gets.chomp
puts "-" * 50

if user_selection = 1
    
  puts "Please enter the link below! Make sure to include \"https://\" for the link."
  puts "-" * 50
  url = gets.chomp
  qrcode = RQRCode::QRCode.new("#{url}")

elsif user_selection = 2

  puts "-" * 50
  puts "Please enter the Wi-Fi network name below!"
  puts "-" * 50
  wifi_name = gets.chomp
  puts "-" * 50
  puts "Please enter the Wi-Fi network password below!"
  puts "-" * 50
  wifi_pass = gets.chomp
  wifi_text = "WIFI:T:WPA;S:#{wifi_name};P:#{wifi_pass};;"
  qrcode = RQRCode::QRCode.new("#{wifi_text}")

elsif user_selection = 3

  puts "-" * 50
  puts "Please enter the phone number below!"
  puts "-" * 50
  phone = gets.chomp
  puts "-" * 50
  puts "Please enter the text below!"
  puts "-" * 50
  text = gets.chomp
  text_send = "SMSTO:#{phone}:#{text}"
  qrcode = RQRCode::QRCode.new("#{text_send}")

elsif user_selection = 4

  puts "-" * 50
  puts "Thank you! Good bye!"
  exit

else 

  puts "-" * 50
  puts "Command not recognized. Please enter a valid number response"
  puts "-" * 50

end

puts "-" * 50
puts "What would you like to call the PNG?"
puts "-" * 50
filename = gets.chomp
png = qrcode.as_png({ :size => 500 })
IO.binwrite("#{filename}.png", png.to_s)

puts "-" * 50
puts "QR Code is now available as #{filename}.png"
