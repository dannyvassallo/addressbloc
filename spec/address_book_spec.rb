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

  it "should add the remove an entry to the address book" do
    book = AddressBook.new
    expect(book.entries.size).to eq 0
    book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    expect(book.entries.size).to eq 1
    book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    expect(book.entries.size).to eq 0
  end

end
