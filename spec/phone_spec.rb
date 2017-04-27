require('rspec')
require('Phone')

describe(Phone) do

  before do
    Phone.clear()
  end

  describe("#type") do
    it("will return the type of phone number") do
      phone1= Phone.new({:type=> "home", :area_code=> "222", :number=> "222-2222"})
      expect(phone1.type()).to(eq("home"))
    end
  end

  describe("#area_code") do
    it("will return the area code") do
      phone1= Phone.new({:type=> "home", :area_code=> "222", :number=> "222-2222"})
      expect(phone1.area_code()).to(eq("222"))
    end
  end

  describe("#number") do
    it("will return the number") do
      phone1= Phone.new({:type=> "home", :area_code=> "222", :number=> "222-2222"})
      expect(phone1.number()).to(eq("222-2222"))
    end
  end

  describe('.all') do
    it('returns the array of all phone numbers') do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the phone number to the array') do
      phone1 = Phone.new({:type=> "home", :area_code=> "222", :number=> "222-2222"})
      phone1.save()
      phone2 = Phone.new({:type=> "work", :area_code=> "333", :number=> "322-2222"})
      phone2.save()
      expect(Phone.all()).to(eq([phone1, phone2]))
    end
  end

  describe('#id') do
    it('returns the id number of the phone') do
      phone1 = Phone.new({:type=> "home", :area_code=> "222", :number=> "222-2222"})
      phone1.save()
      phone2 = Phone.new({:type=> "work", :area_code=> "333", :number=> "322-2222"})
      phone2.save()
      expect(phone2.id()).to(eq(2))
      end
  end
end
