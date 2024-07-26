RSpec.shared_examples "a blog controller" do
  let(:post_id) { "1" }

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("bravura_template_prime/blog/index")
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      get :show, params: { id: post_id }
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show, params: { id: post_id }
      expect(response).to render_template("bravura_template_prime/blog/show")
    end
  end
end
