require 'rails_helper.rb'

describe 'The exception handling', type: :feature do
  it 'should present the 404 exception page' do
    visit '/blabla'

    expect(page).to have_content('Not found')
  end
end
