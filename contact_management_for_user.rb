require_relative "contact_management"
require "colorize"

class InterfaceUser
  def initialize 
    @database = Database.new
  end

  def list_my_contacts
    # do something to print @database 
    print @database.list
  end

  def add_new_contact
    puts "Enter new contact forename".red
    forename = gets.chomp 
    puts "Enter surname".red
    surname = gets.chomp
    puts "Enter phone number"
    telephone = gets.chomp
    puts "Enter address"
    address = gets.chomp
    a_person_new = Person.new(forename, surname,telephone,address)
    @database.add(a_person_new)
    print @database
  end

  def edit_a_contact
    print @database.list
    puts "give me the number of contact you want to update"
    to_be_edited_index_input = gets.chomp
    to_be_edited_index = to_be_edited_index_input.to_i
    puts "what do you want to change? \n
    AA forename \n
    BB Surname \n
    CC Telephone \n
    DD Address".green
    user_choice_of_item = gets.chomp
    update_contact_item_index = 0 if user_choice_of_item == "AA"
    update_contact_item_index = 1 if user_choice_of_item == "BB"
    update_contact_item_index = 2 if user_choice_of_item == "CC"
    update_contact_item_index = 3 if user_choice_of_item == "DD"
    puts "what do you want to change it to ?"
    update_information = gets.chomp
    @database.update
  end

  def delete_a_contact
    print @database.list
    contact_number = @database.count
    while contact_number > 0 do
      puts "give me the number of contact you want to delete"
      to_be_deleted_index = gets.chomp.to_i
      @database.delete(to_be_deleted_index)
      return @database.list
    end
    puts "There is no more contacts to be deleted, please choose other options".red
  end

  def show_all_contacts
    print "Forename, Surname, Telephone, Address".blue + "\n" + @database.show
  end

  def run
    puts "A. List my contact".green
    puts "B. Create new contact".green
    puts "C. Edit a contact".green
    puts "D. Delete a contact".green
    puts "E. Show all contacts".green
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
      if user_choice == "E"
        show_all_contacts
      end
      break if user_choice ==""
      puts "Choose from A B C D again, please".green
    end
  end
end 

user_action = InterfaceUser.new 
user_action.run 
