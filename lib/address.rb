class Address
  attr_accessor(:type, :street, :city, :state, :zip)
  @@addresses = []

  def initialize(attributes)
    @type = attributes.fetch(:type)
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @id = @@addresses.length + 1

  end

  def self.all
    @@addresses
  end

  def self.clear
    @@addresses = []
  end

  def save
    @@addresses.push(self)
  end

  def id
    @id
  end
end
