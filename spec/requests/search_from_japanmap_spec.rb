require 'rails_helper'

RSpec.describe "SearchFromJapanmaps", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/search_from_japanmap/index"
      expect(response).to have_http_status(:success)
    end
  end

end
