require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
      it { should belong_to(:bucketlist) }
    end

  describe "#info" do
    it "returns yes! if completed" do
        item = Item.create(description: 'item', completed: true)
        expect(item.info).to eq("YES")
    end
  end

    it "returns rawr if scary" do
        item = Item.create(description: 'item', completed: false)
        expect(item.info).to eq("Nah")
    end
end
