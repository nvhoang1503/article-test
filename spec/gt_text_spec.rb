require 'spec_helper'

RSpec.describe "Class GtText " do 

  describe "#new" do

    context "with no input params" do 
      let(:gt_text) {GtText.new}

      it "should include the GtText attributes correctly" do 
        expect(gt_text).to have_attributes(:headline => nil)
        expect(gt_text).to have_attributes(:position => 0)
        expect(gt_text).to have_attributes(:like_number => 0)
        expect(gt_text).to have_attributes(:sentence => nil)
      end

      it "should has a GtText object with the basic info" do
        expect(gt_text.headline).to eq(nil)
        expect(gt_text.position).to eq(0)
        expect(gt_text.like_number).to eq(0)
      end

      it "should has a GtText object with sentence is nil" do
        expect(gt_text.sentence).to eq(nil)
      end
    end

    context "with input params" do  
      let(:gt_text) {GtText.new({:headline => "example headline", :sentence => "example sentence"})}

      it "should has a GtText object with the input data" do
        expect(gt_text.headline).to eq("example headline")
        expect(gt_text.position).to eq(0)
        expect(gt_text.like_number).to eq(0)
        expect(gt_text.sentence).to eq("example sentence")
      end

    end
  end

  describe "#update" do

    let(:gt_text) {GtText.new }

    context "update value of headline and sentence" do

      it "should return headline value has been updated" do
        gt_text.update({:headline => "update headline"})
        expect(gt_text.headline).to eq("update headline")
      end

      it "should return sentence value has been updated" do
        gt_text.update({:sentence => "update sentence"})
        expect(gt_text.sentence).to eq("update sentence")
      end
    end

    context "update position" do 
      it "should change GtText position value when update position" do 
        gt_text.update({:position => 1})
        expect(gt_text.position).to eq(1)
      end
    end

    context "update with no input params" do 
      it "should return GtText object default value when updating without input params" do
        gt_text.update()

        expect(gt_text).to have_attributes(:headline => nil)
        expect(gt_text).to have_attributes(:position => 0)
        expect(gt_text).to have_attributes(:like_number => 0)
        expect(gt_text).to have_attributes(:sentence => nil)
      end
    end

    context "increment the article" do
      it "should return the link number has been increased" do
        gt_text.like
        expect(gt_text.like_number).to eq(1)
      end
    end

  end

end