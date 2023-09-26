require "rails_helper"

feature "Customer access Packages Index", js: true do
  let(:customer) { FactoryBot.create(:customer) }

  before do
    sign_in customer
  end

  it "renders root page" do
    visit root_path

    expect(page).to have_content(/Packages/i)
    expect(page).to have_link("Create Shipment")
    expect(page).to have_link("New Package")
  end

  context "when multiple packages exist" do
    before do
      FactoryBot.create_list(:package, 3)
      visit root_path
    end

    it "displays 4 users" do
      expect(page).to have_selector("#package .card", count: 3)
    end

    it "displays links" do
      expect(page).to have_link("Create Shipment")
      expect(page).to have_link("New Package")
    end
  end
end

feature "Customer accesses Package New Form", js: true do
  let(:customer) { FactoryBot.create(:customer) }

  before do
    sign_in customer
  end

  it "should open from the home page" do
    visit root_path
    click_link("New Package")

    expect(page).to have_content(/New Package/i)
    expect(page).to have_selector("input#package_package_name")
    expect(page).to have_selector("textarea#package_description")
    expect(page).to have_selector("input#package_weight")
    expect(page).to have_link("Back to packages")
  end

  context "when creating a new package" do
    before do
      @package_count = Package.count

      visit packages_path
      click_link("New Package")

      expect(page).to have_content(/New Package/i)
    end

    it "does not save when the form is empty" do
      find("input[type=submit]").click

      expect(page).to have_content(/New Package/i)
      expect(page).to have_selector("form#package-form")
      expect(page).to have_content(/Package name can't be blank/i)
      expect(page).to have_content(/Description can't be blank/i)
      expect(Package.count).to eql(@package_count)
    end

    context "when the form fields are filled" do
      let(:package_name) { Faker::Lorem.word }
      let(:description) { Faker::Lorem.paragraph }
      let(:weight) { Faker::Number.decimal(l_digits: 2) }

      before do
        fill_in("package_package_name", with: package_name)
        fill_in("package_description", with: description)
        fill_in("package_weight", with: weight)
      end

      it "creates the package correctly" do
        find("input[type=submit]").click

        expect(page).to have_content(/package was successfully created./i)
        expect(page).to have_content(package_name)
        expect(page).to have_content(description)
        expect(Package.count).to eql(@package_count + 1)
      end

      it "displays validation error when package name is taken" do
        FactoryBot.create(:package, package_name: package_name)
        @package_count = Package.count
        find("input[type=submit]").click

        expect(page).to have_content(/New Package/i)
        expect(page).to have_selector("form#package-form")
        expect(Package.count).to eql(@package_count)
        expect(page).to have_content(/Package name has already been taken/i)
      end
    end
  end
end
