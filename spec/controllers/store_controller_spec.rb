require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'load all of the products into @products' do
      product = create(:product)
      second_product = create(:product, title: 'Korem')
      get :index
      expect(assigns(:products)).to eq [second_product, product]
    end
  end

end
