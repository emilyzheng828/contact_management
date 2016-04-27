require 'pstore'
require 'csv'

class Database

  def initialize(file_name)
    @file_name = file_name
    @database = CSV.read(file_name)
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

  def save!
    CSV.open(@file_name, "w") do |f|
      @database.each do |person|
        f << person
      end
    end
  end
end
