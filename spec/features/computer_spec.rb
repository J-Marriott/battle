require 'computer'

describe Computer do
  subject { described_class.new "HAL" }
  it "returns the computer's name" do
    expect(subject.name).to eq "HAL"
  end
  describe "#takes_damage" do
    let(:damage) {10}
    it "deducts passed damage from health" do
      expect{subject.takes_damage damage}.to change{subject.health}.by(-damage)
    end
  end

end
