# spec/views/bravura_template_prime/blog/index.html.erb_spec.rb
RSpec.describe "bravura_template_prime/blog/index", type: :view do
  let(:presenter) { instance_double(BravuraTemplatePrime::PresentationAdapter) }

  before do
    allow(presenter).to receive(:blog_hero_title).and_return("Welcome to My Blog")
    allow(presenter).to receive(:blog_hero_description).and_return("A place for my thoughts")
    assign(:presenter, presenter)
  end

  it "displays the blog hero title and description" do
    render
    expect(rendered).to have_content("Welcome to My Blog")
    expect(rendered).to have_content("A place for my thoughts")
  end
end
