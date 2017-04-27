class Contact
  attr_accessor(:first_name, :last_name, :job, :company)
  @@contacts = []

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @phones = []
    @emails = []
    @addresses = []
    @id = @@contacts.length + 1
  end

  def id
    @id
  end

  def self.all
    @@contacts
  end

  def self.clear
    @@contacts = []
  end

  def save
    @@contacts.push(self)
  end

  def phones
    @phones
  end

  def add_phone(new_number)
    @phones.push(new_number)
  end

  def emails
    @emails
  end

  def add_email(new_email)
    @emails.push(new_email)
  end

  def addresses
    @addresses
  end

  def add_address(new_address)
    @addresses.push(new_address)
  end

  def self.find(id_number)
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id == id_number
        found_contact = contact
      end
    end
    found_contact
  end
end
