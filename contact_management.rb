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
 
  def delete(to_be_deleted_index)
     @database.delete_at(to_be_deleted_index.to_i)
  end

  def list
    @database.map.with_index do |each_person,index|
      index.to_s + " " + each_person.join(", ") + "\n"
    end.join
  end

  def update
    @database[0][2] = "666666"
    @database[0]
  end
  
  def count
    @database.size
  end
end
