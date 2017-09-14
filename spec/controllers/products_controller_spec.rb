require 'rails_helper'

describe ProductsController, type: :controller do
	context 'GET #index' do
    it 'renders the index page' do 
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show page' do 
      @product = Product.create!(name: "sample")
      get :show, params: {id: @product}
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
  end

  context "POST #create" do
    before do 
      @user = User.create!(email: "bo@mail.com", password: "boyoho")
      sign_in @user
    end
    it "successfully creates new product" do  
      @product = Product.create!(name: "sample")
      expect(response).to have_http_status(200)
    end
    it "cannot create a product" do 
       expect(Product.new(price:nil)).not_to be_valid
    end  
  end

  context "put #update" do
    before do 
      @product = Product.create!(name: "sample")
      @user = User.create!(email: "bo@mail.com", password: "boyoho")
      sign_in @user
    end
    it "successfully updates a product" do
      @update = { name:@product.name, image_url:"images.com", id:@product.id, price:@product.price, colour: "red"}
      put :update, params: { id: @product.id, product: @update}
      @product.reload
      expect(@product.colour).to eq "red"
    end
  end

  context "delete" do 
    before do 
      @product = Product.create!(name: "sample")
      @user = User.create!(email: "bo@mail.com", password: "boyoho")
      sign_in @user
    end
    it "allows admin to delete a product" do 
      delete :destroy, params: {id: @product}
      expect(response).to redirect_to products_path
    end
  end
end