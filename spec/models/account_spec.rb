require "rails_helper"

RSpec.describe Account, type: :model do
  describe "associations" do
    it{is_expected.to have_one :auth_token}
  end

  describe "validations" do
    subject{create :account}
    it{is_expected.to validate_length_of(:account).is_at_most 255}
    it{is_expected.to validate_uniqueness_of(:account).ignoring_case_sensitivity}
  end

  describe "#staff_role" do
    it do
      is_expected.to define_enum_for(:staff_role)
        .with(
          owner: 0, store_manager: 1, staff: 2, cast: 3, driver: 4, clerical: 5,
          call_center: 6, administrator: 7, cs: 8
        )
    end
  end

  describe "#account_div" do
    it do
      is_expected.to define_enum_for(:account_div)
        .with(
          disable: 0, enable: 1, default: 2
        )
    end
  end

  describe "#account_lock" do
    it do
      is_expected.to define_enum_for(:account_lock)
        .with(
          block: 0, active: 1, normal: 2
        )
    end
  end
end
