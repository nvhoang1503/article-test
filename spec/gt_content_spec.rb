require 'spec_helper'

RSpec.describe "Class GtContent" do
  describe "#new" do

    let(:gt_text) {GtText.new }
    let(:gt_photo) {GtPhoto.new}
    let(:gt_content) {GtContent.new(gt_text, gt_photo)}

    context "with input params" do 
      
      it "should has a Content include GtText default value" do
        expect(gt_content.text.headline).to eq(nil) 
        expect(gt_content.text.position).to eq(0) 
        expect(gt_content.text.like_number).to eq(0) 
        expect(gt_content.text.sentence).to eq(nil) 
      end


      it "should has a Content include GtPhoto default value" do
        expect(gt_content.photo.headline).to eq(nil) 
        expect(gt_content.photo.position).to eq(0) 
        expect(gt_content.photo.like_number).to eq(0) 
        expect(gt_content.photo.url).to eq(nil) 
      end
    end

  end


end