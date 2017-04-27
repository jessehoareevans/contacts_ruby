class Email
  attr_accessor(:type, :email)
  @@emails = []

  def initialize(attributes)
    @type = attributes.fetch(:type)
    @email = attributes.fetch(:email)
    @id = @@emails.length + 1
  end

  def self.all
    @@emails
  end

  def self.clear
    @@emails = []
  end

  def save
    @@emails.push(self)
  end

  def id
    @id
  end
end
