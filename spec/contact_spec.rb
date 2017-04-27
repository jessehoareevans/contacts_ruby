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
end
