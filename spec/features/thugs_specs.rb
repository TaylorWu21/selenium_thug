require 'rails_helper'

feature 'thug index', js: true do
		before (:each) do
   	 	@gang_name = 'Yakuza'
   	 	@gang = Gang.create(name: @gang_name)  	   
   	 	visit root_path
   	  find('.gang-show-btn').click
 	 	  find('.gang-member-btn').click
   	end

	context 'without thugs' do

   	scenario 'header vaildation' do
   	    expect(find('#thug-header').text.strip).to eq("Thugs In The Gang: #{@gang_name}")
   	end
	end

	context 'with thugs' do
		before(:each) do
			@name = "Harry"
      find('.create-thug-btn').click
      fill_in('thug[name]', with: @name)
      find('#submit-thug').click
  		find('#gang-thug').click
		end

		scenario 'create a thug' do
      expect(find('.gang-thug').text).to eq("Thug: #{@name}")
  	end

  	scenario 'edit thug' do
  		find('.edit-thug-btn').click
  		@name = 'Larry'
  		fill_in('thug[name]', with: @name)
  		find('#submit-thug').click
  		expect(find('.gang-thug').text).to eq("Thug: #{@name}")
  	end

  	scenario 'delete thug' do
  		find('.delete-thug-btn').click
  		expect(first('#gang-thug')).to eq(nil)
  	end

  	scenario 'go back to gang of thug' do
  		find('.thug-back').click
  		expect(find('#thug-header').text.strip).to eq("Thugs In The Gang: #{@gang_name}")
  	end
	end




end