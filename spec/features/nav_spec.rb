require 'rails_helper'

feature 'Navbar', js: true do

	context 'without gang' do
		scenario 'main nav back to root route' do
			visit new_gang_path
			first('.brand-logo').click
			expect(first('#header').text).to eq('Da Hood')
		end

		scenario 'new gang button' do
			visit root_path
			find('#nav-new-gang').click
			expect(find('#new_gang')).to_not eq(nil)
		end
	end

	context 'with gang' do 
		scenario 'gang dropdown' do
			gang = Gang.create(name: 'Bloods')
			visit root_path
			first('.dropdown-button').click
			expect(first('.gang-dropdown-link').text).to eq(gang.name)
		end
	end
end