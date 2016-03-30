$: << File.expand_path(File.join(File.dirname(__FILE__),"..","lib"))
require 'person'
require 'database'

describe "Contact_system" do
   let(:database) { Database.new("test_database.csv") }

   it "each person should have forename, surname, telephone and address" do
     a_person = Person.new("Emily","Zheng","888888","White House")
     expect(a_person.forename).to eq("Emily")
     expect(a_person.surname).to eq("Zheng")
     expect(a_person.telephone).to eq("888888")
     expect(a_person.address).to eq("White House")
   end
  
   it "should have a database to hold all these information" do
     a_person = Person.new("Emily","Zheng","888888","White House")
     expect(database[0]).to eq(["Emily","Zheng","888888","White House"])
     expect(database[1]).to eq(["Kim","Strong","111111","Dog House"])
   end
  
   it "should be able to add a new contact into the database" do 
     a_new_person = Person.new("Ada","Wong","123456","Church")
     database.add(a_new_person)

     expect(database[2]).to eq(["Ada","Wong","123456","Church"])
     
   end

   it "should be able to save contacts into the file" do
     a_new_person = Person.new("Ada","Wong","123456","Church")
     database.add(a_new_person)
     database.save!

     # TODO: use Ruby to check the length of file, not Unix
     expect(`wc -l "test_database.csv"`.strip.split(' ')[0].to_i).to eq(3) 
     database.delete(2)
     database.save!
   end

   it "should be able to show a LIST of full names only with index number" do
     expect(database.list).to eq("0 Emily Zheng\n"+
                                 "1 Kim Strong\n")
   end

   it "should be able to edit a contact with given index number and element" do
     expect(database.update(0,2,"666666")).to eq(["Emily","Zheng","666666","White House"])
   end

   it "should be able to count the contact list" do 
     expect(database.count).to eq(2)
   end
  
   it "should be able to show all contacts" do 
      expect(database.show(0)).to eq("Emily Zheng 888888 White House")
   end
end 
