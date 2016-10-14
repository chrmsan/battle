require 'spec_helper'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) {double :player }
  let(:player_2) {double :player }

  describe '#attack' do
    it 'damages player 2' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
    # it 'damages player 1 after switches turn'
    #   click_button("Attack!")
    #   expect(player_1).to receive(:receive_damage)
    # end
  end

  describe '#players' do
    it 'knows player 1' do
      expect(game.player_1).to eq player_1
    end
    it 'knows player 2' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#switch turns' do
    it 'switches turn after attack' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content('Jerry\'s turn')
    end
  end


end
