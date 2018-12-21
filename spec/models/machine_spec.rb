require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    it 'calculcates average snack price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = Snack.create(name: "Hot dog", price: 2, machine: dons)
      snack_2 = Snack.create(name: "Corn dog", price: 3, machine: dons)
      snack_3 = Snack.create(name: "Fruit roll up", price: 1, machine: dons)

      expect(dons.average_snack_price).to eq(2)
    end
  end
end
