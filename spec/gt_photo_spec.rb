require 'spec_helper'

RSpec.describe "Class GtPhoto" do
  describe "#new" do

    context "with no input params" do 
      let(:gt_photo) {GtPhoto.new}

      it "should include the GtPhoto attributes correctly" do 
        expect(gt_photo).to have_attributes(:headline => nil)
        expect(gt_photo).to have_attributes(:position => 0)
        expect(gt_photo).to have_attributes(:like_number => 0)
        expect(gt_photo).to have_attributes(:url => nil)
      end

      it "should has a GtPhoto object with the basic info" do
        expect(gt_photo.headline).to eq(nil)
        expect(gt_photo.position).to eq(0)
        expect(gt_photo.like_number).to eq(0)
      end

      it "should has a GtPhoto object with url is nil" do
        expect(gt_photo.url).to eq(nil)
      end
    end

    context "with input params" do  
      let(:gt_photo) {GtPhoto.new({:headline => "photo headline", :url => "path/to/image.jpg"})}

      it "should has a GtPhoto object with the input data" do
        expect(gt_photo.headline).to eq("photo headline")
        expect(gt_photo.position).to eq(0)
        expect(gt_photo.like_number).to eq(0)
        expect(gt_photo.url).to eq("path/to/image.jpg")
      end
    end
  end 

  describe "#update" do

    let(:gt_photo) {GtPhoto.new }

    context "update value of headline and url" do

      it "should return headline value has been updated" do
        gt_photo.update({:headline => "update headline"})
        expect(gt_photo.headline).to eq("update headline")
      end

      it "should return url value has been updated" do
        gt_photo.update({:url => "path/to/image2.jpg"})
        expect(gt_photo.url).to eq("path/to/image2.jpg")
      end
    end

    context "update position" do 
      it "should change GtPhoto position value when update position" do 
        gt_photo.update({:position => 1})
        expect(gt_photo.position).to eq(1)
      end
    end

    context "update with no input params" do 
      it "should return GtPhoto object default value when updating without input params" do
        gt_photo.update()

        expect(gt_photo).to have_attributes(:headline => nil)
        expect(gt_photo).to have_attributes(:position => 0)
        expect(gt_photo).to have_attributes(:like_number => 0)
        expect(gt_photo).to have_attributes(:url => nil)
      end
    end

    context "increment the article" do
      it "should return the link number has been increased" do
        gt_photo.like
        expect(gt_photo.like_number).to eq(1)
      end
    end

  end

end
