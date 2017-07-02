require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Admin update recipe type' do
  scenario 'successfully' do
    #cria os dados necessários
    dessert_type = RecipeType.create(name: 'Sobremesa')

    # simula a ação do usuário
    login_as create( :user ), scope: :user
    visit root_path

    click_on 'RecipeTypes'
    click_on 'Editar'

    fill_in 'Nome', with: 'Novo Tipo'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Novo Tipo')
  end
end
