class Rolodex

	attr_accessor :contacts 

	def initialize
		@contact_id = 1000
		@contacts = [
			Contact.new("Vladimir", "Dralo", "v@d.com", "hi"),
			Contact.new("Hassan", "The great", "v@d.com", "hi"),
			Contact.new("Vladimir", "Dralo", "v@d.com", "hi")
		]
	end


	def add_contact(contact)
		contact.id = @contact_id
		@contacts << contact
		@contact_id += 1
	end

	def modify_contact(contact)
		@contacts << contact
		contact.id = @contact_id
		@contact_id += 1
	end

	def search(last_name)
		@contacts.find do |contact|
			contact.last_name == last_name
		end
	end
end