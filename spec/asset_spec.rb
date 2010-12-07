require 'spec_helper'

require File.expand_path('spec/spec_helper')

describe Fakerama::Asset do

  it "should have some adverts" do
    Fakerama::Asset::Advert.mpu.path.should =~ /mpu\.jpg$/
  end

  it "should have some photos" do
    Fakerama::Asset::Photo.landscape.path.should =~ /landscape\.jpg$/
  end


end
