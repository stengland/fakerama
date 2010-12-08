require 'spec_helper'

describe Fakerama::Content do
  it "should create html headings" do
    Fakerama::Content.headings(2..4).should =~ /<h2>/
    Fakerama::Content.headings(2..4).should_not  =~ /<h1>/
  end

  it "should create html lists" do
    # Default ul
    html = Fakerama::Content.list(4)
    html.should match(/<ul>/)
    html.should match(/(<li>.*){4}/)
    html.should_not match(/(<li>.*){5}/)
    # ol
    html = Fakerama::Content.list(:ol, 4)
    html.should_not match(/<ul>/)
    html.should match(/<ol>/)
    html.should match(/<li>/)
    # ul
    html = Fakerama::Content.list(:ul, 4)
    html.should match(/<ul>/)
    html.should match(/<li>/)
  end

  it "should create html paragraphs" do
    html = Fakerama::Content.paragraphs(4)
    html.should match(/(<p>.*){4}/)
    html.should_not match(/(<p>.*){5}/)
  end

  it "should create other tags filled with content" do
    Fakerama::Content.filled_tag('blockquote').should match(/<blockquote>.*<\/blockquote>/)
  end

  it "should generate content" do
    Fakerama::Content.content
  end
end
