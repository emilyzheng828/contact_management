require 'pstore'

class Database
  

  def initialize 
    @database = []
    File.open("database.csv", mode = "rt").each do |line|
       @database << line.gsub("\n","").split(",")
    end
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
      index.to_s + " " + each_person[0..1].join(" ") + "\n"
    end.join
  end

  def show(selected_index)
    @database[selected_index].join(" ")
  end

  def update(to_be_edited_index, update_contact_item_index, update_information)
    @database[to_be_edited_index][update_contact_item_index] = update_information
    @database[to_be_edited_index]
  end

  def count
    @database.size
  end

  def get(number)
    @database[number].to_h
  end
end
