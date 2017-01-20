require 'game'

describe Game do
  let(:player_1) { double :player_1, name: "Hooch" }
  let(:player_2) { double :player_2, name: "Turner", takes_damage: nil}
  let(:game) {described_class.new player_1, player_2}
  let(:gameAI) {described_class.new player_1, computer}
  let(:computer) { Computer.new}

  describe '#initialize' do
    it "initializes a game with computer if no player 2 inputted" do
      expect(gameAI.player_2.name).to eq "HAL"
    end
    it "intializes a game with 2 players" do
      expect(game.player_1.name). to eq "Hooch"
      expect(game.player_2.name). to eq "Turner"
    end
  end
  describe '#attack' do
    it "attacks the opposing player" do
      game.itself.attack player_2
      expect(player_2).to have_received(:takes_damage)
    end
  end
  describe '#player_1' do
    it "is expected to get player_1" do
      expect(game.itself.player_1).to eq player_1
    end
  end
  describe '#player_2' do
    it "is expected to get player_2" do
      expect(game.itself.player_2).to eq player_2
    end
  end
  describe '#active_player' do
    it "returns the active player" do
      expect(game.itself.active_player).to eq player_1
    end
  end
  describe '#switch' do
    it "switches players after their turn" do
      game.itself.switch
      expect(game.itself.active_player).to eq player_2
    end
  end
end
