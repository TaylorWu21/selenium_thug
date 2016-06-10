require 'rails_helper'

# Capybara DSL (Domain Specific Language)

feature 'Gangs index', js: true do
	context 'no gangs' do
		before(:each) do
			# root_path = gangs#index
			visit root_path
		end

		scenario 'header validation' do
			expect(find('#header').text.strip).to eq('Da Hood')
		end

		scenario 'correct message if no gang' do
			expect(find('#no-gangs-header').text).to eq('No gangs, the city is clean!')
		end

		scenario 'create a gang' do
			find('#new-gang-btn').click
			fill_in('gang[name]', with: 'West Side')
			# PROGRAMMER WAY - Find the form by id and call form.submit
			# USER WAY - Find the submit button and click on it
			find('#submit-gang-btn').click
			expect(find('.card-title').text).to eq('West Side')
		end

		scenario 'fill out form of new gang and back out' do
			visit new_gang_path
			fill_in('gang[name]', with: 'West Side')
			find('#cancel-gang').click
			expect(find('#header')).to_not eq(nil)
			expect(first('.card-title')).to eq(nil)
		end
	end

	context 'with gangs' do
		before(:each) do
			@gang_name = 'Bloods'
			@gang = Gang.create(name: @gang_name)
			visit root_path
		end

		scenario 'gang card is correct' do
      expect(find('.card-title').text).to eq(@gang_name)
    end

		scenario 'gang show button' do
			first('.gang-show-btn').click
			expect(find('#gang-header').text).to eq(@gang_name)
		end
	end
end