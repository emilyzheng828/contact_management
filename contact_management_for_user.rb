require_relative "contact_management"
require "colorize"

class InterfaceUser
  def initialize 
    @database = Database.new
  end

  def list_my_contacts
    print @database.list
  end

  def add_new_contact
    puts "Enter new contact forename".green
    forename = gets.chomp 
    puts "Enter surname".green
    surname = gets.chomp
    puts "Enter phone number".green
    telephone = gets.chomp
    puts "Enter address".green
    address = gets.chomp
      a_person_new = Person.new(forename, surname,telephone,address)
      @database.add(a_person_new)
  end

  def edit_a_contact
    print @database.list
    puts "give me the number of contact you want to update"
    to_be_edited_index_input = gets.chomp
    to_be_edited_index = to_be_edited_index_input.to_i
    if to_be_edited_index > @database.count-1 || to_be_edited_index < 0
      puts "Please type in a number between 0 and #{@database.count-1}".red
      return
    end
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
    if update_contact_item_index == nil 
      puts "Please type in AA BB CC or DD".red 
      return
    end
    puts "what do you want to change it to ?"
    update_information = gets.chomp
    @database.update(to_be_edited_index,update_contact_item_index,update_information)
  end

  def delete_a_contact
    print @database.list
    contact_number = @database.count
    while contact_number > 0 do
      puts "Give me the number of contact you want to delete"
      to_be_deleted_index = gets.chomp.to_i
     if to_be_deleted_index > @database.count-1 || to_be_deleted_index < 0
      puts "Please type in a number between 0 and #{@database.count-1}".red
      return
    end 
      @database.delete(to_be_deleted_index)
      return @database.list
    end
    puts "There is no more contacts to be deleted, please choose other options".red
  end

  def show_all_contacts
    puts @database.list
    puts "Select a contact you want to check".green
    selected_index = gets.chomp.to_i
    if selected_index > @database.count-1 || selected_index < 0
      puts "Please type in a number between 0 and #{@database.count-1}".red
      return
    end 
    print "Forename, Surname, Telephone, Address".blue + "\n" + @database.show(selected_index).to_s+"\n"
  end

  def run
    puts "A. List my contact".green
    puts "B. Create new contact".green
    puts "C. Edit a contact".green
    puts "D. Delete a contact".green
    puts "E. Show selected contact".green
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
      puts "Choose from A B C D E again, please".green
    end
  end
end 

user_action = InterfaceUser.new 
user_action.run 
