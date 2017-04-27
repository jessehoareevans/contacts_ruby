require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the contact path', {:type => :feature}) do
  it('displays the id of added contacts after the user submits the form') do
    visit('/new_contact')
    fill_in('first_name', :with => "Jesse")
    click_button('Add Contact')
    expect(page).to have_content('Contacts')
  end
end
