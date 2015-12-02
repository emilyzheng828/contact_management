require_relative 'contact_management'

describe "Contact_system" do
  let(:database) { Database.new }

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
  it "should be able to save a new contact into the database" do 
    a_new_person = Person.new("Ada","Wong","123456","Church")
    database << a_new_person
    expect(database[2]).to eq(["Ada","Wong","123456","Church"])
  end
  it "should be able to show a list with index number" do
    expect(database.list).to eq("0 Emily, Zheng, 888888, White House\n"+
                                "1 Kim, Strong, 111111, Dog House\n")
  end
  it "should be able to edit a contact with given index number and element" do
    expect(database.update).to eq(["Emily","Zheng","666666","White House"])
  end
end 
