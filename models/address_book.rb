require_relative "entry.rb"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone, email))
  end

  def get_entry(index)
    if index >= 0 && index < entries.size
      return entries[index]
    else
      system "clear"
      puts "The index you selected is out of range."
    end
  end
end
