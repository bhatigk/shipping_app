require "rails_helper"

RSpec.describe Package, type: :model do
  subject { FactoryBot.build(:package) }

  describe "associations" do
    it { is_expected.to have_one(:shipment) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.package_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end
