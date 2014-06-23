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

  scenario 'User can edit and update list of movies' do
    visit '/'
    click_on 'Add a movie'
    fill_in 'Title', with: 'Gone With the Wind'
    fill_in 'Actor', with: 'Clark Gable'
    click_on 'Create a movie'
    expect(page).to have_content 'Gone With the Wind'
    expect(page).to have_content 'Clark Gable'
    click_on 'Gone With the Wind'
    expect(page).to have_content 'Gone With the Wind'
    expect(page).to have_content 'Clark Gable'
    click_on 'Edit'
    fill_in 'Title', with: 'Good Ship Lollipop'
    fill_in 'Actor', with: 'Shirley Temple'
    click_on 'Update'
    expect(page).to have_content 'Good Ship Lollipop'
    expect(page).to have_content 'Shirley Temple'
    expect(page).to have_no_content 'Gone With the Wind'
    expect(page).to have_no_content 'Clark Gable'
  end

  scenario 'User can delete movie from list' do
    visit '/'
    click_on 'Add a movie'
    fill_in 'Title', with: 'Gone With the Wind'
    fill_in 'Actor', with: 'Clark Gable'
    click_on 'Create a movie'
    expect(page).to have_content 'Gone With the Wind'
    expect(page).to have_content 'Clark Gable'
    click_on 'Gone With the Wind'
    expect(page).to have_content 'Gone With the Wind'
    expect(page).to have_content 'Clark Gable'
    click_on 'Delete'
    expect(page).to have_no_content 'Gone With the Wind'
    expect(page).to have_no_content 'Clark Gable'
  end
end