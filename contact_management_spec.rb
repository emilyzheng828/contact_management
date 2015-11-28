class Person
attr_accessor :forename, :surname, :telephone, :address 
  def initialize(forename, surname, telephone, address)
    @forename = forename
    @surname = surname
    @telephone = telephone
    @address = address
  end
 def to_a
 [forename, surname, telephone, address]
 end
end

class Database
  def initialize 
    @database = []
    @database[0] = ["Emily","Zheng","888888","White House"] 
    @database[1] = ["Kim","Strong","111111","Dog House"]
  end
  def [](index)
    @database[index] 
  end
  def <<(a_new_person)
    @database << a_new_person.to_a
  end
  
end

describe "Contact_system" do
  it "each person should have forename, surname, telephone and address" do
    a_person = Person.new("Emily","Zheng","888888","White House")
    expect(a_person.forename).to eq("Emily")
    expect(a_person.surname).to eq("Zheng")
    expect(a_person.telephone).to eq("888888")
    expect(a_person.address).to eq("White House")
  end
  it "should have a database to hold all these information" do
    database = Database.new
    a_person = Person.new("Emily","Zheng","888888","White House")
    expect(database[0]).to eq(["Emily","Zheng","888888","White House"])
    expect(database[1]).to eq(["Kim","Strong","111111","Dog House"])
  end
  it "should be able to save a new contact into the database" do 
    database = Database.new
    a_new_person = Person.new("Ada","Wong","123456","Church")
    database << a_new_person
  expect(database[2]).to eq(["Ada","Wong","123456","Church"])
end
end 
