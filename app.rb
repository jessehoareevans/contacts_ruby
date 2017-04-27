require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/phone')
require('./lib/email')
require('./lib/address')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @all_contacts = Contact.all()
  erb(:index)
end

#Add Contact
get('/new_contact') do
  erb(:contact_form)
end

get('/contacts/:id') do
  contact_id = params.fetch('id').to_i()
  @contact = Contact.find(contact_id)
  @contact_phones = @contact.phones()
  @contact_emails = @contact.emails()
  @contact_addresses = @contact.addresses()
  erb(:contact)
end

post('/contact_form') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job = params.fetch('job')
  company = params.fetch('company')
  @contact = Contact.new({:first_name=> first_name, :last_name => last_name, :job=> job, :company=> company})
  @contact.save()
  @all_contacts = Contact.all()
  erb(:index)
end

###Contact Phone

get('/contact/:id/phones/new') do
  contact_id = params.fetch('id').to_i()
  @contact = Contact.find(contact_id)
  erb(:phone_form)
end

post('/phone_form') do
  type = params.fetch('type')
  area_code = params.fetch('area_code')
  number = params.fetch('number')
  @phone = Phone.new({:type=> type, :area_code => area_code, :number=> number})
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_phone(@phone)
  @contact_phones = @contact.phones()
  @contact_emails = @contact.emails()
  @contact_addresses = @contact.addresses()
  erb(:contact)
end

##Contact Email

get('/contact/:id/emails/new') do
  contact_id = params.fetch('id').to_i()
  @contact = Contact.find(contact_id)
  erb(:email_form)
end

post('/email_form') do
  type = params.fetch('type')
  email = params.fetch('email')
  @email = Email.new({:type=> type, :email => email})
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_email(@email)
  @contact_emails = @contact.emails()
  @contact_phones = @contact.phones()
  @contact_addresses = @contact.addresses()
  erb(:contact)
end

##Contact addresses
  get('/contact/:id/addresses/new') do
    contact_id = params.fetch('id').to_i()
    @contact = Contact.find(contact_id)
    erb(:address_form)
  end

  post('/address_form') do
    type = params.fetch('type')
    street = params.fetch('street')
    city = params.fetch('city')
    state = params.fetch('state')
    zip = params.fetch('zip')
    @address = Address.new({:type=> type, :street=> street, :city=> city, :state=> state, :zip=> zip})
    @contact = Contact.find(params.fetch('contact_id').to_i())
    @contact.add_address(@address)
    @contact_addresses = @contact.addresses()
    @contact_emails = @contact.emails()
    @contact_phones = @contact.phones()
    erb(:contact)
  end
