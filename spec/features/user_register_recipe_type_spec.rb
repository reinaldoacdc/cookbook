require 'rails_helper'

feature 'User register recipe_jype' do
  let(:user){FactoryGirl.create(:user)}

  def fill_in_signin_fields
    fill_in "user[email]",with: user.email
    fill_in "user[password]",with: user.password
    click_button "Log in"
  end


  scenario 'successfully' do
    visit root_path
    click_link "Login"
    fill_in_signin_fields
    visit new_recipe_type_path
    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesa')
    expect(page).to have_content('Nenhuma receita encontrada para este tipo de receitas')
  end

  scenario 'and must fill in name' do
    visit new_recipe_type_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end
end
