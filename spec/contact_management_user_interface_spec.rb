require_relative "../lib/contact_management_user_interface"
require_relative "../lib/database"
require "rspec"

describe InterfaceUser do
   before do
     $stdout = StringIO.new
     @interface = InterfaceUser.new
   end

   after do
     $stdout = STDOUT
     $stdin  = STDIN
   end

   it 'prints the menu' do
     @interface.menu
     expect($stdout.string).to eq(
       "------------------------".blue+"\n"+
       "A. List my contact".green+"\n"+
       "B. Create new contact".green+"\n"+
       "C. Edit a contact".green+"\n"+
       "D. Delete a contact".green+"\n"+
       "E. Show selected contact".green+"\n"+
       "------------------------".blue + "\n"
     )
   end
     it 'list my contacts' do
       @interface.list_my_contacts
       expect($stdout.string).to eq(
         "0 Emily Zheng"+ "\n"+
         "1 Kim Strong" + "\n"
       )
     end

     it "shows selected contact" do
       $stdin = StringIO.new("0\n")
       @interface.show_selected_contact
       expect($stdout.string).to eq(
         "0 Emily Zheng" + "\n" +
         "1 Kim Strong" + "\n" +
         "Select a contact you want to check".green + "\n"+
         "Forename, Surname, Telephone, Address".yellow + "\n"+
         "-------------------------------------"+ "\n" +
         "Emily Zheng 888888 White House" + "\n" +
         "-------------------------------------" + "\n" )
     end
   
     it "create a contact" do
       $stdin = StringIO.new("Cloud\n" + "White\n" + "202020\n" + "Cathouse\n")
       @interface.create_new_contact
       expect($stdout.string).to eq(
         "Enter new contact forename".green + "\n" +
         "Enter surname".green + "\n" +
         "Enter phone number".green + "\n" +
         "Enter address".green + "\n")
       expect(@interface.database[2]).to eq(
         ["Cloud", "White", "202020", "Cathouse"])
     end

     it "deletes a contact" do
       $stdin = StringIO.new("1\n")
       @interface.delete_a_contact
       expect($stdout.string).to eq(
         "0 Emily Zheng"+ "\n"+
         "1 Kim Strong" + "\n"+
         "give me the number of contact you want to delete" + "\n"
       )
       expect(@interface.database[1]).to eq(
         nil)
     end

     it "edits a contact" do
       $stdin = StringIO.new("1\n" + "BB\n" + "Tim\n")
       @interface.edit_a_contact
       expect($stdout.string).to eq(
         "0 Emily Zheng"+ "\n"+
         "1 Kim Strong" + "\n"+
         "Give me the number of contact you want to update".green + "\n" +
         "what do you want to change?".green + "\n" +
         "AA forename".green + "\n" +
         "BB Surname".green + "\n" +
         "CC Telephone".green + "\n" +
         "DD Address".green + "\n" +
         "what do you want to change it to ?"+ "\n" )
       expect(@interface.database[1]).to eq(
      ["Kim", "Tim", "111111", "Dog House"] )
     end
end
