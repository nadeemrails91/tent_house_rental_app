require './transaction'
require './tent_house'


class Booking
    
    def initialize
        @transaction = Transaction.new
        @tent_house = TentHouse.new
    end    
    
    
    def show_available_options
        @tent_house.get_available_options
    end    
    
    def get_item_details id
        @tent_house.get_item id
    end    
        
    
    def new_booking
        loop do
            puts "Enter Item ID:"
            id=gets.to_i
            if id.between?(1,9)
                item_details = get_item_details id
                puts "Enter Quantity [#{item_details[:name]}]:"
                quantity=gets.to_i

                if !(quantity>item_details[:quantity]) && !(quantity<=0) 
                    @tent_house.set_quantity id,quantity,"OUT"
                    id=@transaction.new_transaction id,quantity
                    puts "Success: Booking request accepted - Transaction ID: #{id}"
                else    
                    puts "Error: Goes beyond quantity available for this item"
                end
            else
              puts "Enter item id from above mentioned data."  
            end    
            puts "Book Another Item [press 'n' for NO or any other key for yes]:"
            ch=gets.chomp
        break if ch=="n"
        end
    end    
    

    def return_items
        loop do
            puts "Enter Transaction ID:"
            trans_id=gets.to_i
            if @transaction.validate_transaction trans_id
                puts "Confirm Return (press 'n' for NO or any other key for yes):"
                flag=gets.chomp
                if flag=="y"
                    return_details=@transaction.update_previous_and_create_new trans_id
                    @tent_house.set_quantity return_details[:item_id],return_details[:quantity],"IN"
                    puts "Success: Return request accepted - Transaction ID: #{return_details[:return_trans_id]}"
                end    
            else
                puts "Failure: Invalid Transaction ID / Already Returned"    
            end 
            puts "Return Another Item [press 'n' for NO or any other key for yes]:"
            ch=gets.chomp
        break if ch=="n"
        end       
    end

    

    def show_all_booking_transactions
        puts
        all_items=@tent_house.get_all_items
        all_items.each do |key,value|
            puts "Item Name: #{value[:name]}"
            puts "Available Quantity: #{value[:quantity]}"
            puts
            @transaction.print_all_transactions key
        end    
    end






















    
end    