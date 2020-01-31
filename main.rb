
require './booking'
puts "Welcome to 'Tent House Rental'"
print "What's your name? "
input=gets
name=input.chomp
puts "Welcome, #{name}! "

booking = nil
while true
  puts
  puts "Choose Your option"
  puts "Option Code 0: Initiate Item Data"
  puts "Option Code 1: Show List of all items with available quantity"
  puts "Option Code 2: Book one or more item for rent"
  puts "Option Code 3: Return one or more item"
  puts "Option Code 4: Show Tent House Transaction for All Items"
  puts "Option Code 9: For Exit"
  input = gets.chomp
  input = input.to_i if !input.nil? && !input.empty?
  
  case input
  when 0
    booking = Booking.new
    puts "Initializing item data..."    
    puts "Item data have been initialized."
  when 1
    if booking != nil
      booking.show_available_options 
    else    
      puts "Please initialize item data first by entering option code 0"    
    end
  when 2
    if booking != nil
      booking.new_booking
    else
        puts "Please initialize item data first by entering option code 0"
    end    
  when 3
    if booking != nil
      booking.return_items
    else
        puts "Please initialize item data first by entering option code 0"
    end    
  when 4
    if booking != nil
        booking.show_all_booking_transactions
    else
      puts "Please initialize item data first by entering option code 0"
    end    
  when 9
    puts "Thank you #{name} for visiting,have a nice day!"
    exit
  else
    puts "Wrong choice, Please Choose a correct option."
  end

end

                