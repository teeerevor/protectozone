###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end
activate :dotenv

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

activate :s3_sync do |sync|
  sync.bucket                     = ENV['aws_bucket']
  sync.region                     = ENV['aws_region']
  sync.aws_access_key_id          = ENV['aws_access_key_id']
  sync.aws_secret_access_key      = ENV['aws_secret_access_key']
  sync.prefer_gzip                = true
  sync.path_style                 = true
  sync.reduced_redundancy_storage = false
  sync.acl                        = 'public-read'
  sync.encryption                 = false
  sync.after_build                = false
end

