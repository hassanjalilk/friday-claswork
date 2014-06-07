
require_relative 'contact'
require_relative 'rolodex'

class CRM

	attr_accessor :name, :user_inputs

	def self.run(name)
		crm = CRM.new(name)
		crm.main_menu
	end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new 
	end

	def print_main_menu
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display an attribute"
	  puts "[6] Exit"
	  puts "Enter a number: "

	end

	def main_menu
		puts "Welcome to #{name}"
		print_main_menu
	  selection = gets.chomp.to_i
	  call_option(selection)
	end

	def call_option(selection)
		case selection
		when 1 then add_new_contact
		when 2 then modify_contact
	  when 3 then delete_contact 
	  when 4 then display_contacts
	  when 5 then display_attribute
	  when 6 
	  	puts "Goodbye!"
	  	return
	  else
			puts "Invalid option. please try again!"
			main_menu
		end
	end

	def add_new_contact
	  print "Enter First Name: "
	  first_name = gets.chomp
	  print "Enter Last Name: "
	  last_name = gets.chomp
	  print "Enter Email Address: "
	  email = gets.chomp
	  print "Enter a Note: "
	  note = gets.chomp
	  @rolodex.add_contact(Contact.new(first_name, last_name, email, note))
	  main_menu
	end

	def modify_contact
		print "Last Name to be modified:"
		last_name = gets.chomp
		found_contact = @rolodex.search(last_name)
		if found_contact
			puts found_contact.first_name
			print "New first name:"
			first_name_to_be_modified = gets.chomp
			
			print "New last name:"
			last_name_to_be_modified = gets.chomp
			
			print "Email:"
			email_to_be_modified = gets.chomp
			
			print "Note:"
			note_to_be_modified = gets.chomp

		else
			puts "No contact found."
		end

		yes_or_no = confirmation 
		if yes_or_no == true
			found_contact.first_name = first_name_to_be_modified
			found_contact.last_name = last_name_to_be_modified
			found_contact.email = email_to_be_modified
			found_contact.note = note_to_be_modified
			puts "changes saved!"
		else 
			puts "change did not save!"
		end
		main_menu
	end

	def confirmation
	 puts "Are you sure you want to change your information? [1] Yes  [2] No"
	 confirmation = gets.chomp.to_i
	 if confirmation == 1
	 	true
	 else
	 	false
	 	end
	end

	def display_contacts
		puts "[1] Last Name"
		puts "[2] All contacts"
		puts "[3] First Names Only"
		puts "[4] Email Only"

		user_input = gets.chomp.to_i

		if user_input == 1 
			puts "Please enter your lastname: "
			last_name = gets.chomp

				found_contact = @rolodex.search(last_name)

			if found_contact
		 	 found_contact.show
			else
				puts "Contact does not exist"
			end


		elsif user_input == 2
				@rolodex.show_all

		elsif user_input == 3
			 @rolodex.show_first

		elsif user_input == 4
			 @rolodex.show_email

		else
			main_menu
		end
	end

	def delete_contact
		puts "Please enter the last name:"
		last_name = gets.chomp
		found_contact = @rolodex.search(last_name)

		if found_contact
			@rolodex.delete(found_contact)
			puts "Contact was successfully deleted!"

	else
			puts "Does not exist"
		end
		main_menu
	end
end






CRM.run("Bitmaker Labs CRM")


# crm = CRM.new("Bitmaker Labs CRM")
# crm.main_menu

# 		puts "Please confirm your selection:"
# 			puts "[1] Yes"
# 			puts "[2] No"
# 			if 1
# 			found_contact.first_name = first_name_to_be_modified
# 			print "Modified!"
# 		else
# 			main_menu
# 		end
# end

