feature "the signin process" do
  # before :each do
  #   User.make(:email => 'user@example.com', :password => 'password')
  # end
  scenario "signs me in" do
    visit '/'
    # within("#session") do
    #   fill_in 'Email', :with => 'user@example.com'
    #   fill_in 'Password', :with => 'password'
    # end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
