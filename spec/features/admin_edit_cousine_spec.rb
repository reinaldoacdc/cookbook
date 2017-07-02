require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Admin update recipe type' do
  scenario 'successfully' do
    #cria os dados necessários
    cuisine = Cuisine.create(name: 'Arabe')

    # simula a ação do usuário
    login_as create( :user ), scope: :user
    visit root_path

    click_on 'Cuisines'
    click_on 'Editar'

    fill_in 'Nome', with: 'Nova Cozinha'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Nova Cozinha')
  end
end
