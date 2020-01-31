class TentHouse
   
  def initialize
    @items =  { 
      1 => {  name: 'Plastic Chairs' , quantity: 10000 , booked: 0 } , 
      2 => {  name: 'Tiffany Chairs' , quantity: 5000 , booked: 0 } ,
      3 => {  name: 'Bridal Chair'   , quantity: 10 , booked: 0 } , 
      4 => {  name: 'Plastic Round Tables' , quantity: 100 , booked: 0 } , 
      5 => {  name: 'Plastic Rectangular Table' , quantity: 90 , booked: 0 } , 
      6 => {  name: 'Steel Folding Table' , quantity: 80 , booked: 0 } , 
      7 => {  name: 'Gas Stoves' , quantity: 25 , booked: 0 } , 
      8 => {  name: 'Chair Covers' , quantity: 6000 , booked: 0 } , 
      9 => {  name: 'Table Cloths' , quantity: 500 , booked: 0 } 
    }
  end    
      
  def get_available_options
    puts
    items_not_exhausted = @items.select{ |k,v| v[:quantity] != 0 }
    puts format("%-12s %-29s %-20s","Item ID","Item Name","Available Quantity" )
    items_not_exhausted.each do |k,v|
      puts format("%-12i %-29s %-20s", k, v[:name], v[:quantity] )
    end
    puts
  end    
  
  
  def get_item(id)
    @items[id]
  end    
  
  def set_quantity(id, quantity, type)
    if type == "OUT"
      @items[id][:quantity] -= quantity 
      @items[id][:booked] += quantity 
    elsif type == "IN"
      @items[id][:quantity] += quantity 
      @items[id][:booked] -= quantity 
    end
  end  

  def get_all_items
    @items
  end  
  
end    

