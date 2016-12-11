RSpec.describe "Class Article" do

  before(:each) do 
    @status = GtArticle::STATUS
    gt_text      = GtText.new
    gt_photo     = GtPhoto.new
    @gt_content   = GtContent.new(gt_text, gt_photo)
    @gt_article   = GtArticle.new("Article Title", @gt_content)
  end

  describe "#new" do
    context "with title and content" do
      it "should include the Article attributes correctly " do 
        expect(@gt_article).to have_attributes(:title => "Article Title")
        expect(@gt_article).to have_attributes(:content => @gt_content)
        expect(@gt_article).to have_attributes(:created_at => DateTime.now())
        expect(@gt_article).to have_attributes(:updated_at => DateTime.now())
        expect(@gt_article).to have_attributes(:activated_at => nil)
        expect(@gt_article).to have_attributes(:like_number => 0)
        expect(@gt_article).to have_attributes(:status => "In Active")
      end
    end
  end


  describe "#update" do
    context "update with input paramas" do

      it "should update title value and the updated_at has been changed" do
        @gt_article.update({:title => "new title"})
        expect(@gt_article.title).to eq("new title")
        expect(@gt_article.updated_at.to_s).to be == DateTime.now.to_s
      end

      it "should update like number value and the updated_at has been changed" do
        @gt_article.update({:like_number => 123})
        expect(@gt_article.like_number).to eq(123)
        expect(@gt_article.updated_at.to_s).to be == DateTime.now.to_s
      end

      it "should update status value and the updated_at has been changed" do
        @gt_article.update({:status => GtArticle::STATUS[:active]})
        expect(@gt_article.status).to be == "Active"  
        expect(@gt_article.updated_at.to_s).to be == DateTime.now.to_s
      end  
    end
  end
  
  describe "#status" do
    context "there are 2 statuses on the Article" do
      it "should has active status" do
        expect(@status[:active]).to eq(1)
      end
      it "should has in active status" do
        expect(@status[:in_active]).to eq(0)
      end
    end

    context "value of the status should be text" do
      it "should show 'Actice' when the status is STATUS[:active]" do 
        @gt_article.update({:status => GtArticle::STATUS[:active]})
        expect(@gt_article.status).to eq("Active") 
      end
      it "should show 'In Actice' when the status is STATUS[:in_active]" do 
        @gt_article.update({:status => GtArticle::STATUS[:in_active]})
        expect(@gt_article.status).to eq("In Active") 
      end
    end
  end

  describe "#mark_active" do
    context "mark the article is active" do
      it "should be active status" do
        @gt_article.mark_active
        expect(@gt_article.status).to eq("Active")
      end

      it "should be current time for the activated_at value" do 
        @gt_article.mark_active
        expect(@gt_article.activated_at.to_s).to be == DateTime.now.to_s
      end
    end
  end 

  describe "#mark_in_active" do
    context "mark the article be inactive" do
      it "should be inactive " do 
        @gt_article.mark_in_active
        expect(@gt_article.status).to eq("In Active")
      end
    end
  end

  describe "#is_active" do
    context "check current status of the acticle" do
      it "shoul resturn TRUE when the acticle active" do 
        @gt_article.mark_active
        respone = @gt_article.is_active
        expect(respone).to be true
      end

      it "shoul resturn FALSE when the acticle inactive" do 
        @gt_article.mark_in_active
        respone = @gt_article.is_active
        expect(respone).to be false
      end
    end
  end

  describe "#post" do
    context "post the article" do
      it "the posted_at should be nil when the artcile has not been posted yet" do
        expect(@gt_article.posted_at).to be_nil
      end

      it "the posted_at should not nil when the artcile has been posted yet" do
        @gt_article.post
        expect(@gt_article.posted_at).to be_truthy
      end
    end
  end

  describe "#is_posted"  do
    context "check the article has been posted or not" do
      it "should return FALSE when the article has not been posted yet" do
        respone = @gt_article.is_posted
        expect(respone).to be false
      end

      it "should return TRUE when the article has been posted" do
        @gt_article.post
        respone = @gt_article.is_posted
        expect(respone).to be true
      end
    end
  end

  describe "#like" do 
    context "make like the article" do
      it "should increment the like number" do
        num = @gt_article.like_number
        @gt_article.like
        expect(@gt_article.like_number).to eq(num + 1)
      end
    end

  end




end