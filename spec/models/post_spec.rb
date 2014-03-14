require 'spec_helper'

describe Post do

  before do 

  end

  context "has attributes" do 
    it "should have attribute content" do
      first_post = Post.new(content: "Lorum Ipsum etc etc")
      expect(first_post.content).to eq("Lorum Ipsum etc etc")
    end

    it "should have an author" 
  end

  context "has validations" do 
    it "content cannot be nil"
  end

  context "has associations" do 
    it "kori says never to test associations, but I think it might be useful to have code that shows us how polymorphism works"
    
  end

end