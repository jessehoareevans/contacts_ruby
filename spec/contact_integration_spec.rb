require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the contact path', {:type => :feature}) do
  it('displays the id of added contacts after the user submits the form') do
    visit('contact_form')
    fill_in('first_name', :with => 'Jesse', 'last_name', :with => 'Evans', 'job', :with => 'Student', 'company' :with => 'Epicodus')
    click_button('Add Contact')
  end
end
