require_relative "contact_management"

class InterfaceUser
  def initialize 
    @database = Database.new
  end
  
  def list_my_contacts
    # do something to print @database 
    print @database.list
  end

  def add_new_contact
    puts "Enter new contact forename"
    forename = gets.chomp 
    puts "Enter surname"
    surname = gets.chomp
    puts "Enter phone number"
    telephone = gets.chomp
    puts "Enter address"
    address = gets.chomp
    a_person_new = Person.new(forename, surname,telephone,address)
    @database << a_person_new
    print @database
  end
  def edit_a_contact
    print @database.list
    puts "give me the number of contact you want to update"
    to_be_edited_index = gets.chomp
  end
  def delete_a_contact
    print @database.list
    puts "give me the number of contact you want to delete"
    to_be_deleted_index = gets.chomp.to_i
    @database.delete(to_be_deleted_index)
    return @database.list
  end

  def run
    puts "A. List my contact"
    puts "B. Create new contact"
    puts "C. Edit a contact"
    puts "D. Delete a contact"
    while true 
      user_choice = gets.chomp
      if user_choice == "A"
        list_my_contacts
      end  
      if user_choice == "B"
        add_new_contact
      end
      if user_choice == "C"
        edit_a_contact
      end
      if user_choice == "D"
        delete_a_contact
      end
      break if user_choice ==""
    end
  end
end 

user_action = InterfaceUser.new 
user_action.run 