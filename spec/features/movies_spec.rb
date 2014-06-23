require 'spec_helper'

feature 'Manage Movies' do
  scenario 'User can create and view list of movies' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a movie'
    fill_in 'Title', with: 'Gone With the Wind'
    fill_in 'Actor', with: 'Clark Gable'
    click_on 'Create a movie'
    expect(page).to have_content 'Gone With the Wind'
    expect(page).to have_content 'Clark Gable'
  end
end