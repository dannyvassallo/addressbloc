require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end

  context "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end
  end

  it "should initialize entries as an array" do
    expect(book.entries).to be_a(Array)
  end

  it "should initialize entries as empty" do
    expect(book.entries.size).to eq 0
  end

  it "should add then remove an entry from the address book" do

    book.add_entry('Ann A', '555-123-123', 'aa@aamail.example')
    book.add_entry('Bobby B', '555-456-456', 'bb@bbmail.example')
    book.add_entry('Carol C', '555-789-789', 'cc@ccmail.example')
    book.remove_entry('Bobby B', '555-456-456', 'bb@bbmail.example')

    expect(book.entries.size).to eq 2
    expect(book.entries.first.name).to eq 'Ann A'
    expect(book.entries.last.name).to eq 'Carol C'
    book.remove_entry('Ann A', '555-123-123', 'aa@aamail.example')

    expect(book.entries.size).to eq 1
    expect(book.entries.last.name).to eq 'Carol C'
    book.remove_entry('Carol C', '555-789-789', 'cc@ccmail.example')

    expect(book.entries.size).to eq 0
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eql 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end

  end

  context "second import_from_csv attempt" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size
      expect(book_size).to eql 3
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Billy", "555-555-4854", "billy@blocmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Bobby", "555-555-5415", "bobby@blocmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Joey", "555-555-3660", "joey@blocmail.com")
    end

  end


  context "#binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end
  end

  it "searches AddressBook for Bill" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Bill")
    expect entry.instance_of?(Entry)
    check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
  end

  it "searches AddressBook for Bob" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Bob")
    expect entry.instance_of?(Entry)
    check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
  end

  it "searches AddressBook for Joe" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Joe")
    expect entry.instance_of?(Entry)
    check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
  end

  it "searches AddressBook for Sally" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Sally")
    expect entry.instance_of?(Entry)
    check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
  end

  it "searches AddressBook for Sussie" do
    book.import_from_csv("entries.csv")
    entry = book.binary_search("Sussie")
    expect entry.instance_of?(Entry)
    check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
  end

end
