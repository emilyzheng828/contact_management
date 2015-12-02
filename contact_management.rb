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

  def add(a_new_person)
    @database << a_new_person.to_a
  end

  def delete(to_be_deleted_index)
    @database.delete_at(to_be_deleted_index.to_i)
  end

  def list
    @database.map.with_index do |each_person,index|
      index.to_s + " " + each_person[0..1].join(", ") + "\n"
    end.join
  end

  def update
    updated_information = "666666"
    to_be_edited_index = 0
    update_contact_item_index = 2
    @database[to_be_edited_index][update_contact_item_index] = updated_information
    @database[to_be_edited_index]
  end

  def count
    @database.size
  end

end
