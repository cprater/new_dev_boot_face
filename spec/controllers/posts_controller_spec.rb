#require 'rspec'
require 'spec_helper'

describe PostsController do
  let(:post) {Post.new(content: "Here's my post!", author: "Steve Dave")}

  it "has content" do
    post.content { should exist }
  end

  it "has author" do
    expect(post.author).to eq "Steve Dave"
  end

end
