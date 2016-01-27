require_relative "contact_management"
require "colorize"

class InterfaceUser
  def initialize 
    @database = Database.new
  end
  
  def menu
    puts "------------------------".blue
    puts "A. List my contact".green
    puts "B. Create new contact".green
    puts "C. Edit a contact".green
    puts "D. Delete a contact".green
    puts "E. Show selected contact".green
    puts "------------------------".blue
  end

  def list_my_contacts
    print @database.list
  end

  def getting_full_details_from_user
    puts "Enter new contact forename".green
    @forename = gets.chomp 
    puts "Enter surname".green
    @surname = gets.chomp
    puts "Enter phone number".green
    @telephone = gets.chomp
    puts "Enter address".green
    @address = gets.chomp
  end

  def add_new_contact
    getting_full_details_from_user
    a_person_new = Person.new(@forename, @surname, @telephone, @address)
    @database.add(a_person_new)
  end

  def ask_user_what_to_be_changed
    puts "what do you want to change? 
    AA forename 
    BB Surname 
    CC Telephone 
    DD Address".green
  end
  
  def choice_of_update_item
    update_contact_item_index = nil
    until (0..3).include?(update_contact_item_index)
      user_choice_of_item = gets.chomp.upcase
      update_contact_item_index = 0 if user_choice_of_item == "AA"
      update_contact_item_index = 1 if user_choice_of_item == "BB"
      update_contact_item_index = 2 if user_choice_of_item == "CC"
      update_contact_item_index = 3 if user_choice_of_item == "DD"
      if update_contact_item_index == nil 
        puts "Please type in AA BB CC or DD".red 
        next
      end
      return update_contact_item_index
    end
  end
  
  def user_number_valid?(user_input)
    if user_input.to_i.to_s == user_input
      user_input = user_input.to_i
      user_input >= 0 && user_input < @database.count
    else 
      false
    end
  end

  def edit_a_contact
    print @database.list
    puts "Give me the number of contact you want to update".green
    to_be_edited_index_input = gets.chomp
    
    if user_number_valid?(to_be_edited_index_input)
      ask_user_what_to_be_changed
      update_contact_item_index = choice_of_update_item
      puts "what do you want to change it to ?"
      update_information = gets.chomp
      @database.update(to_be_edited_index_input.to_i, update_contact_item_index, update_information)
    else
      puts "Please type in a number between 0 and #{@database.count-1}".red
    end
  end

  def delete_a_contact
    print @database.list
    contact_number = @database.count
    if contact_number == 0 
      puts "There is no more contacts to be deleted, please choose other options".red
    end
    puts "give me the number of contact you want to delete"
    to_be_deleted_index = gets.chomp
    if user_number_valid?(to_be_deleted_index)
      to_be_deleted_index.to_i
      @database.delete(to_be_deleted_index)
      return @database.list
    else
      puts "Please type in a number between 0 and #{@database.count-1}".red
    end
  end

  def show_selected_contact
    puts @database.list
    puts "Select a contact you want to check".green
    selected_index = gets.chomp
    if user_number_valid?(selected_index)
      print "Forename, Surname, Telephone, Address".yellow + "\n" +"-------------------------------------"+"\n"+ @database.show(selected_index.to_i).to_s+"\n"+"-------------------------------------"+"\n"
    else
      puts "Please type in a number between 0 and #{@database.count-1}".red
    end
  end

  def run
    menu
    while true 
      user_choice = gets.chomp.upcase
      puts "\e[H\e[2J"
      case user_choice
      when "A"
        list_my_contacts
      when "B"
        add_new_contact
      when "C"
        edit_a_contact
      when "D"
        delete_a_contact
      when "E"
        show_selected_contact
      end
      break if user_choice ==""
      puts "Choose from A B C D E again, please".red
      menu
    end
  end
end 

user_action = InterfaceUser.new 
user_action.run 
