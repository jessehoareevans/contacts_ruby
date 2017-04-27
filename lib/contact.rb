class Contact
  attr_accessor(:first_name, :last_name, :job, :company)
  @@contacts = []

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
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
end
