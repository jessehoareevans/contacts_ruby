class Phone
  attr_accessor(:type, :area_code, :number)
  @@phones = []

  def initialize(attributes)
    @type = attributes.fetch(:type)
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @id = @@phones.length() + 1
  end

  def self.all
    @@phones
  end

  def save
    @@phones.push(self)
  end

  def id
    @id
  end

  def self.clear
    @@phones = []
  end
end
