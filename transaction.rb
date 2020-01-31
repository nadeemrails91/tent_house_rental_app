class Transaction
    
  def initialize
    @transactions={}
    @transactions_items_mapping=[]
    @@transaction_id=123
  end    

  def new_transaction item_id,quantity ,type="OUT"
  	transaction_id=@@transaction_id
  	@transactions[transaction_id] = {date: Time.now.strftime("%d/%m/%Y %H:%M:%S"), type: "OUT",quantity: quantity,returned: false} if type == "OUT"
  	@transactions[transaction_id] = {date: Time.now.strftime("%d/%m/%Y %H:%M:%S"), type: "IN", quantity: quantity} if type == "IN"
  	new_transaction_item item_id,transaction_id	
  	@@transaction_id += 1
  	return transaction_id	
  end
  
  def new_transaction_item item_id,trans_id
  	@transactions_items_mapping.push({item_id: item_id,trans_id: trans_id})
  end	

  def validate_transaction trans_id
 		return true	if @transactions.key?(trans_id) && @transactions[trans_id][:type] == "OUT" && @transactions[trans_id][:returned] == false
 		false
  end

  def update_previous_and_create_new trans_id
 		@transactions[trans_id][:returned] = true
	  item_id=get_item_id_of_this_transaction trans_id
	  return_trans_id=new_transaction item_id,@transactions[trans_id][:quantity],"IN"
	  return {:item_id=>item_id,:return_trans_id=>return_trans_id,:quantity=>@transactions[trans_id][:quantity]}
  end

  def get_item_id_of_this_transaction trans_id
 		@transactions_items_mapping.each do |trans_item|
 			if trans_item[:trans_id] == trans_id
 				return trans_item[:item_id]
 			end
 		end		
  end

  def print_all_transactions item_id
 		all_trans_ids_of_current_item = get_item_transactions item_id
 		if !all_trans_ids_of_current_item.empty?
 			puts format("%-17s %-24s %-10s %-10s","Transaction ID","Date/time","Type","quantity")
 			@transactions.each do |key,value|
 				if all_trans_ids_of_current_item.include? key
 					puts format("%-17s %-24s %-10s %-10s","#{key}","#{value[:date]}","#{value[:type]}","#{value[:quantity]}")
 				end	
 			end
      puts "-" * 10
 			puts
 		else
 			puts "-" * 10
 			puts
 		end			
  end

  def get_item_transactions item_id
 		transaction_ids_of_current_item=[]
 		@transactions_items_mapping.each do |trans_item|
 			if trans_item[:item_id] == item_id
 				transaction_ids_of_current_item.push(trans_item[:trans_id])
 			end	
 		end
	  transaction_ids_of_current_item
  end

end    

