feature "Enter names - " do
  scenario "Enter names for both players - " do
    sign_in_and_play
    expect(page).to have_content "Turner vs. Hooch"
  end
end

feature "viewing hit points - " do
  scenario "seeing player2's hit points - " do
    sign_in_and_play
    expect(page).to have_content "Hooch HP:100"
  end
end

feature "attack other player" do
  scenario "attack other player and get confirmation" do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content "You have attacked Hooch!"
  end
end

feature "players do damage" do
  scenario "attack other player and do 10 damage" do
    sign_in_and_play
    click_button 'Attack!'
    click_button 'OK!'
    expect(page).to have_content "Hooch HP:90"
    click_button 'Attack!'
    click_button 'OK!'
    expect(page).to have_content "Turner HP:90"
  end
end

feature "switches after each turn" do
  scenario "active_player switches after attack" do
    sign_in_and_play
    expect(page).to have_content "Turner's turn"
    click_button 'Attack!'
    click_button 'OK!'
    expect(page).to have_content "Hooch's turn"
    click_button 'Attack!'
    click_button 'OK!'
    expect(page).to have_content "Turner's turn"
  end
end

feature "players can lose" do
  scenario "player loses when hp reaches 0" do
    sign_in_and_play
    18.times{attack}
    click_button 'Attack!'
    expect(page).to have_content "Turner wins"
  end
end
