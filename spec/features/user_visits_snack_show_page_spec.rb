require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit the snack show page' do
    it 'shows info about the snacks' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      hidive  = owner.machines.create(location: "Hi-Dive")
      snack_1 = Snack.create(name: "Hot dog", price: 2, machine: [dons, hidive])
      snack_2 = Snack.create(name: "Corn dog", price: 3, machine: [dons])
      snack_3 = Snack.create(name: "Fruit roll up", price: 1, machine: [dons, hidive])

      visit snack_path(snack)

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)
      expect(page).to_not have_content(snack_2.name)
      expect(page).to_not have_content(snack_3.name)
      expect(page).to have_content(dons.location)
      expect(page).to have_content(hidive.location)
    end
  end
end
