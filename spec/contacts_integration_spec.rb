require ('capybara/rspec')
require ('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Home page') do
  it('opens home page as default page', {:type => :feature}) do
    visit('/')
    expect(page.find_by_id('submit_button')).to have_content("Submit")
  end
end

describe('Contacts details') do
  it('opens home page as default page', {:type => :feature}) do
    visit('/')
    fill_in('first_name', :with => 'Richa')
    fill_in('last_name', :with => 'Shaurbh')
    fill_in('company', :with => 'Microsoft')
    fill_in('contact_no', :with => '12345')
    fill_in('contact_details', :with => 'beltown, Seattle,Washington')
    click_button('Submit')
    expect(page.find('//a')).to have_content("Richa Shaurbh")
  end
end

describe('Contacts details') do
  it('opens home page as default page', {:type => :feature}) do
    visit('/')
    click_link 'Richa Shaurbh'
    expect(page.find_by_id('edit_button')).to have_content("Edit")
  end
end
