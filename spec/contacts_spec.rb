require ('rspec')
require ('pry')
require ('./lib/contacts')

describe("#contacts") do
  it("will save data") do
    contacts = Contacts.new({:first_name=> "jane", :last_name=>"doe", :company=>"amazon", :job_title=>"software developer", :contact=> {:contact_type =>"home", :contact_no => "123456", :contact_details => "4th Ave, Battery, ABC Apartment Belltown"}})
    contacts.save()
    expect(contacts.first_name).to(eq("jane"))
  end

  it("will give all items") do
    contact_list = Contacts.all()
    expect(contact_list[1].first_name).to(eq("jane"))
  end

  it("will give contact deatil") do
    contact_list = Contacts.all()
    expect(contact_list[1].contact[:contact_details]).to(eq("4th Ave, Battery, ABC Apartment Belltown"))
  end

  it("will give index of array") do
    contact_list = Contacts.all()
    expect(contact_list[1].id).to(eq(1))
  end

  it("it should not accept the same first and last name") do
    expect(Contacts.is_name_exist?("jane", "doe")).to(eq(true))
  end

  it("should update") do
    contacts = Contacts.new({:first_name=> "Richa", :last_name=>"Shaurbh", :company=>"amazon", :job_title=>"software developer", :contact=> {:contact_type =>"home", :contact_no => "123456", :contact_details => "4th Ave, Battery, ABC Apartment Belltown"}})
    contacts.save()
    Contacts.update({:id => 2, :company=>"microsoft"})
    contact_list = Contacts.all()
    expect(contact_list[2].company).to(eq("microsoft"))
  end

end
