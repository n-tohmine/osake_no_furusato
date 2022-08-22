require 'rails_helper'

RSpec.describe "Breweries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/breweries/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/breweries/show"
      expect(response).to have_http_status(:success)
    end
  end

end
