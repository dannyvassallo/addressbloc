require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

  context "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
  end

  it "should initialize entries as an array" do
    book = AddressBook.new
    expect(book.entries).to be_a(Array)
  end

  it "should initialize entries as empty" do
    book = AddressBook.new
    expect(book.entries.size).to eq 0
  end

  it "should add then remove an entry from the address book" do
    book = AddressBook.new

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

end
