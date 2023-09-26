require "rails_helper"

RSpec.describe Package, type: :model do
  subject { FactoryBot.build(:shipment) }

  describe "associations" do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:package) }
    it { is_expected.to belong_to(:delivery_partner) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a source location" do
      subject.source_location = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a target location" do
      subject.target_location = nil
      expect(subject).to_not be_valid
    end
  end
end
