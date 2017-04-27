require('rspec')
require('contact')
require('address')
require('email')
require('phone')

describe(Contact) do
  before do
    Contact.clear()
  end

  describe("#first_name") do
    it("will return the fist name") do
      test_contact = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
    expect(test_contact.first_name()).to(eq("Jesse"))
    end
  end

  describe(".all") do
    it("will return what is in the array") do
      test_contact = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      test_contact2 = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      test_contact.save()
      test_contact2.save()
      expect(Contact.all()).to(eq([test_contact, test_contact2]))
    end
  end

  describe(".clear") do
    it("will clear the array") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("save") do
    it("will save the contact to the array") do
      test_contact = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      test_contact2 = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      test_contact.save()
      test_contact2.save()
      expect(Contact.all()).to(eq([test_contact, test_contact2]))
    end
  end

  describe('#phone') do
    it('returns all phones in the phone array') do
      test_contact = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      expect(test_contact.phones()).to(eq([]))
    end
  end

  describe('#add_phone') do
    it('adds phone number to the contact') do
      test_contact = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      test_phone1 = Phone.new({:type=> "home", :area_code=> "222", :number=> "222-2222"})
      test_contact.add_phone(test_phone1)
      expect(test_contact.phones).to(eq([test_phone1]))
    end
  end

  describe('#add_email') do
    it('adds email address to the contact') do
      test_contact = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      test_email = Email.new({:type=> "work", :email=> "jesse@work.com"})
      test_contact.add_email(test_email)
      expect(test_contact.emails).to(eq([test_email]))
    end
  end

  describe('#add_address') do
    it('adds an address to the contact') do
      test_contact = Contact.new({:first_name=> "Jesse", :last_name=> "Evans", :job=> "student", :company=>'Epicodus'})
      test_address = Address.new({:type=> "home", :street=> "main st", :city=> "Seattle", :state=> "WA", :zip=> "98005"})
      test_contact.add_address(test_address)
      expect(test_contact.addresses).to(eq([test_address]))
    end
  end
end
