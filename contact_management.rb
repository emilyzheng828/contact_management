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

    
