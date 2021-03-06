require 'rails_helper'

describe ApplicationController, type: :controller do

  controller do
    def index
      raise AccessDenied
    end
  end

  describe "handling AccessDenied exceptions" do
    it "redirects to the /401.html (access denied) page" do
      get :index
      expect(response).to redirect_to('/401.html')
    end
  end
end