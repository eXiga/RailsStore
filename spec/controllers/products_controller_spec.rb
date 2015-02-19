require 'rails_helper'


RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "responds with 200 HTTP code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "load all of the products into @products" do
      product = create(:product)
      get :index
      expect(assigns(:products)).to eq [product]
    end
  end

  describe "GET #show" do
    pending
  end

  describe "GET #edit" do
    pending
  end

  describe "GET #new" do
    it "responds with 200 HTTP code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "creates a new product and store it into @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "POST create" do
    it "creates a new product" do
      expect{
        post :create, product: attributes_for(:product)
      }.to change(Product, :count).by(1)
    end

    it "redirects to the new product" do
      post :create, product: attributes_for(:product)
      expect(response).to redirect_to(Product.last)
    end

    it "does not create a new product with invalid data" do
      expect {
        post :create, product: attributes_for(:invalid_product)
      }.to_not change(Product, :count)
    end

    it "re-renders the new method" do
      post :create, product: attributes_for(:invalid_product)
      expect(response).to render_template :new
    end
  end

  describe "PUT update" do
    before :each do
      @product = create(:product, title: 'Lorem', description: 'Ipsum')
    end

    it 'works with valid entity' do
      put :update, id: @product, product: attributes_for(:product)
      expect(assigns(:product)).to eq @product
    end

    it 'changes product attributes' do
      put :update, id: @product, product: attributes_for(:product)
      @product.reload
      expect(@product.title).to eq 'Lorem Ipsum'
      expect(@product.description).to eq 'Wibbles are fun!'
    end

    it 'redirects to the updated product' do
      put :update, id: @product, product: attributes_for(:product)
      expect(response).to redirect_to(@product)
    end
  end

  describe "DELETE destroy" do
    before :each do
      @product = create(:product)
    end

    it "deletes the product" do
      expect{
        delete :destroy, id: @product
      }.to change(Product, :count).by(-1)
    end

    it "redirects to products#index" do
      delete :destroy, id: @product
      expect(response).to redirect_to products_url
    end
  end
end

