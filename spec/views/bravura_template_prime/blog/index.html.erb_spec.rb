# spec/views/bravura_template_prime/blog/index.html.erb_spec.rb
# ** FIXME: nota bene: this is part of an older approach to use the bravura_template_base gem to switch templates
# We are using a different approach now, but this is still here for reference
# RSpec.describe "bravura_template_prime/blog/index", type: :view do
#   let(:presenter) { instance_double(BravuraTemplatePrime::PresentationAdapter) }
#   let(:post) { instance_double("Post",
#     title: "Sample Post",
#     content: "Lorem ipsum",
#     published_at: Time.new(2023, 1, 1),
#     author_name: "John Doe"
#   ) }

#   before do
#     allow(presenter).to receive(:blog_hero_title).and_return("Welcome to My Blog")
#     allow(presenter).to receive(:blog_hero_description).and_return("A place for my thoughts")
#     assign(:presenter, presenter)
#   end

#   context "when there are posts" do
#     before do
#       assign(:posts, [ post ])
#     end

#     it "displays the blog hero title" do
#       render
#       expect(rendered).to have_content("Welcome to My Blog")
#     end

#     it "displays the blog hero description" do
#       render
#       expect(rendered).to have_content("A place for my thoughts")
#     end

#     it "displays the post title" do
#       render
#       expect(rendered).to have_content("Sample Post")
#     end

#     it "displays the post content" do
#       render
#       expect(rendered).to have_content("Lorem ipsum")
#     end

#     it "displays the post publication date" do
#       render
#       expect(rendered).to have_content("January 01, 2023")
#     end

#     it "displays the post author" do
#       render
#       expect(rendered).to have_content("John Doe")
#     end
#   end

#   context "when there are no posts" do
#     before do
#       assign(:posts, [])
#     end

#     it "displays a message when no posts are found" do
#       render
#       expect(rendered).to have_content("No posts found.")
#     end
#   end
# end
