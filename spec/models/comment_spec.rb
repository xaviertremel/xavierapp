require 'rails_helper'

describe Comment, :type => :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:product) { FactoryGirl.create(:product) }

  it "should not validate a comment without a body" do
    @comment = FactoryGirl.build(:comment, user_id: user.id, product_id: product.id, body: nil)
    expect(@comment).not_to be_valid
  end

  it "should not validate a comment without a user" do
    @comment = FactoryGirl.build(:comment, user_id: nil, product_id: product.id)
    expect(@comment).not_to be_valid
  end

  it "should not validate a comment without a product" do
    @comment = FactoryGirl.build(:comment, user_id: user.id, product_id: nil)
    expect(@comment).not_to be_valid
  end

  it "should not validate a comment if rating is not an integer" do
    @comment = FactoryGirl.build(:comment, user_id: user.id, product_id: product.id, rating: 1.3)
    puts @comment.rating
    expect(@comment).not_to be_valid
  end

end