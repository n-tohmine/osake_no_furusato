require 'rails_helper'

RSpec.describe Review, type: :model do
  it "is valid with user, brewery, and star" do
    user = FactoryBot.create(:user)
    brewery = FactoryBot.create(:brewery)
    review = FactoryBot.build(:review, user: user, brewery: brewery)
    expect(review).to be_valid
  end

  it "is invalid without a star" do
    user = FactoryBot.create(:user)
    brewery = FactoryBot.create(:brewery)
    review = FactoryBot.build(:review, user: user, brewery: brewery, star: nil)
    expect(review).to_not be_valid
  end
end
