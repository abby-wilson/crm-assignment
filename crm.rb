require_relative 'contact'
class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
     puts '[2] Modify an existing contact'
     puts '[3] Delete a contact'
     puts '[4] Display all the contacts'
     puts '[5] Search by attribute'
     puts '[6] Exit'
     puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
     when 1 then add_new_contact
     when 2 then modify_existing_contact
     when 3 then delete_contact
     when 4 then display_all_contacts
     when 5 then search_by_attribute
     when 6 then exit
     # Finish off the rest for 3 through 6
     # To be clear, the methods add_new_contact and modify_existing_contact
     # haven't been implemented yet
     end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'How would you like to search by? '
    search_by_attribute = gets.chomp

    print 'What is the value for the contact'
    current_value = gets.chomp

    contact_to_update = Contact.find_by(search_by_attribute, current_value)
    # puts contact_to_update

    print 'Which attribute would you like to change?: '
    attribute_to_modify = gets.chomp
  #
    print 'What would you like to change it to?: '
    new_value = gets.chomp

    if contact_to_update == nil
        puts "Could not update contact"
      else
        contact_to_update.update(search_by_attribute, current_value)
        print "#{current_value} has changed to #{new_value}"
      end
  end

  def delete_contact

  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end

a_crm_app = CRM.new
a_crm_app.main_menu
a_crm_app.print_main_menu
