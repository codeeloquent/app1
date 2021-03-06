require 'rails_helper'

context "Validation testing" do
  it "is not valid without name" do
    expect(Product.new(name: nil)).not_to be_valid
  end
end

describe Product do 

  context 'when the product has comments' do

    let (:product) {Product.create!(name:"race bike")}
    let (:user) {User.create!(first_name: "John", last_name:"Philips", email: "johny_p@yahoo.com", password: "secret")}
     
  	before do
    	product.comments.create!(rating: 1, user: user, body: "Awful bike!")
    	product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    	product.comments.create!(rating: 5, user: user, body: "Great bike!")
  	end
  
  	it "returns the average rating of all comments" do
    	expect(product.average_rating).to eq(3)
    end

    it "returns the lowest rating comment" do
      expect(product.lowest_rating_comment.rating).to eq 1
    end

    it "returns the highest rating comment" do
      expect(product.highest_rating_comment.rating).to eq 5
    end
 
    it "is not valid without a name" do
    	expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end
end