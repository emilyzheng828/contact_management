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
