require 'rails_helper'

RSpec.describe "Keeps", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/keeps/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/keeps/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
