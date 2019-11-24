
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
    input = gets.chomp
    input=input.to_i if !input.nil? && !input.empty?
    
    case input
        when 0
            booking=Booking.new
            puts "Initializing Tent House..."    
            puts "Tent House Initialized."
        when 1
            if booking!=nil
                booking.show_available_options 
            else    
                puts "Initialize first by pressing 0"    
            end
        when 2
            if booking!=nil
                booking.new_booking
            else
                puts "Initialize first by pressing 0"
            end    
        when 3
            if booking!=nil
                booking.return_items
            else
                puts "Initialize first by pressing 0"
            end    
        when 4
            if booking!=nil
                booking.show_all_booking_transactions
            else
                puts "Initialize first by pressing 0"
            end    
        when 9
            puts "Thankyou #{name} for choosing Tent House Rental,Have a great day!"
            exit
        else
          puts "Choose a correct option."
        end
    
    

    
end

                