require ('rspec')
require ('./lib/contacts')
require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('pry')

get("/") do
  @lists = Contacts.all()
  erb(:home)
end

post("/") do
  last_name = params.fetch("last_name")
  first_name = params.fetch("first_name")
  company = params.fetch("company")
  job_title = params.fetch("job_title")
  contact_type = params.fetch("contact_type")
  contact_no = params.fetch("contact_type")
  contact_details = params.fetch("contact_details")
  if !Contacts.is_name_exist?(first_name, last_name)
    contacts = Contacts.new({:first_name=> first_name, :last_name=> last_name, :company=> company, :job_title=> job_title, :contact=> {:contact_type =>contact_type, :contact_no => contact_no, :contact_details => contact_details}})
    contacts.save()
  end
  @lists = Contacts.all()
  erb(:home)
end

get("/contact/:id") do
  @id = params[:id].to_i
  @lists = Contacts.all()
  erb(:contacts_details)
end


post("/edit/:id") do
  @id = params[:id].to_i
  value =params["edit_details_value"]
  name =params["edit_details_name"]
  if name == "First Name"
      Contacts.update({:id => @id, :first_name => value })
  elsif name == "Last Name"
    Contacts.update({:id => @id, :last_name =>  value})
  elsif name == "Company"
    Contacts.update({:id => @id, :company =>  value})
  elsif name == "Job Title"
    Contacts.update({:id => @id, :job_title =>  value})
  end
  @id = params[:id].to_i
  @lists = Contacts.all()
  erb(:contacts_details)
end
