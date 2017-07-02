require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User register recipe_jype' do
  #let(:user){FactoryGirl.create(:user)}


  scenario 'successfully' do
    login_as create( :user ), scope: :user
    visit root_path
    #click_link "Login"
    #fill_in_signin_fields
    visit new_recipe_type_path
    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesa')
    expect(page).to have_content('Nenhuma receita encontrada para este tipo de receitas')
  end

  scenario 'and must fill in name' do
    login_as create( :user ), scope: :user
    visit new_recipe_type_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end
end
