require_relative '../models/address_book.rb'

RSpec.describe AddressBook do  
  context "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end
 
    it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq 0
    end
  end

  context ".add_entry" do
    it "adds only one entry to the address book" do 
      book = AddressBook.new     
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      
      expect(book.entries.size).to eq 1
    end

    it "adds the correct information to entries" do
      book = AddressBook.new     
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq 'Ada Lovelace'
      expect(new_entry.phone_number).to eq '010.012.1815'
      expect(new_entry.email).to eq 'augusta.king@lovelace.com'
    end
  end

  context "get_entry" do
    it "checks the first entry" do
      book.import_from_csv("entries.csv")
      first_entry = book.get_entry(0)
      check_entry(first_entry, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "checks the middle entry" do
      book.import_from_csv("entries.csv")
      middle_entry = book.get_entry(2)
      check_entry(middle_entry, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "checks the last entry" do
      book.import_from_csv("entries.csv")
      last_entry = book.get_entry(4)
      check_entry(last_entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end
    
    it "checks output of index below zero" do
      expect {book.get_entry(-1)}.to output("The index you selected is out of range.\n").to_stdout
    end

    it "checks output of index greater than entries.size" do
      expect {book.get_entry(99)}.to output("The index you selected is out of range.\n").to_stdout
    end

  end
end
