class Contact

  @@contacts = []
  @@id = 1

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note


  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end


  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  def self.all
     p @@contacts
  end


  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    case attribute
    when "first_name"
      self.first_name = new_value
    when "last_name"
      self.last_name = new_value
    when "email"
      self.email = new_value
    when "note"
      self.note = new_value
    else
      puts "Invalid attribute, please try again"
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)

    @@contacts.each do |current_contact|
      if attribute == "first_name" && value == current_contact.first_name
        return current_contact

      elsif attribute == "last_name" && value == current_contact.last_name
        return current_contact

      elsif attribute == "email" && value == current_contact.email
        return current_contact

      elsif attribute == "note" && value == current_contact.note
        return current_contact
      end
    end
  end


  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end

abby = Contact.create('Abby', 'Wilson', 'abbywilson@gmail.com', 'Me')
joe = Contact.create('Joe', 'Bloggs', 'joebloggs@gmail.com', 'Work')
jane = Contact.create('Jane', 'Doe', 'janedoe@gmail.com', 'School')
# p Contact.find(id = 2)
# p abby.update("first_name", "Abigail")
p Contact.find_by('first_name', 'Joe')
# Contact.delete
# p abby
