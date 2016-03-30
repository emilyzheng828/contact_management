
$: << File.expand_path(File.join(File.dirname(__FILE__),"..","lib"))
require 'database'

describe "Contact_system" do
  let(:database) { Database.new }
  
  it "should be able to save a new contact into the database" do 
    new_person = { name: "Ada", surname:"Wong", phone:"123", address:"church" } 
    database.add(new_person)
    expect(database.get(2)).to eq(new_person)
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
