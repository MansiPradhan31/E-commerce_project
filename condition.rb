class Condition
	def self.check_condition
	    puts "Enter 1 to go back or any other key to continue..."
	    choice = gets.chomp.to_i
	    if choice == 1
	      return true 
	    end
	    false
	end
end
