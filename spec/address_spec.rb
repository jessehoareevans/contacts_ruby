require('rspec')
require('address')

describe(Address) do
  describe("#type") do
    it("returns the type of address") do
      test_address = Address.new({:type=> "home", :street=> "main st", :city=> "Seattle", :state=> "WA", :zip=> "98005"})
      expect(test_address.type()).to(eq("home"))
    end
  end

  describe(".all") do
    it("shows what is inside the array") do
      expect(Address.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("save the input to the array") do
      test_address = Address.new({:type=> "home", :street=> "main st", :city=> "Seattle", :state=> "WA", :zip=> "98005"})
      test_address.save()
      expect(Address.all()).to(eq([test_address]))
    end
  end
end
