require ('rspec')
require ('email')

describe(Email) do

  before do
    Email.clear()
  end

  describe("#type") do
    it("returns the type of email address") do
      email1 = Email.new({:type=> "Work", :email=> "work@gmail.com"})
      expect(email1.type()).to(eq("Work"))
    end
  end

  describe("#email") do
    it("returns the email address") do
      email1 = Email.new({:type=> "Work", :email=> "work@gmail.com"})
      expect(email1.email()).to(eq("work@gmail.com"))
    end
  end

  describe(".all") do
      it("return whatever is in the array") do
        expect(Email.all()).to(eq([]))
      end
  end

  describe(".clear") do
    it("clears the array") do
      expect(Email.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the email to the array") do
      email1 = Email.new({:type=> "Work", :email=> "work@gmail.com"})
      email1.save()
      email2 = Email.new({:type=> "Work", :email=> "work@gmail.com"})
      email2.save()
      expect(Email.all()).to(eq([email1, email2]))
    end
  end

  describe("#id") do
    it("returns an id number of the email") do
      email1 = Email.new({:type=> "Work", :email=> "work@gmail.com"})
      email1.save()
      email2 = Email.new({:type=> "Work", :email=> "work@gmail.com"})
      email2.save()
      expect(email1.id()).to(eq(1))
      expect(email2.id()).to(eq(2))
    end
  end
end
