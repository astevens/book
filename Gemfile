source :rubygems

merb_gems_version = "1.1.3"
merb_related_gems = "~> 1.1.0"

gem "json_pure", ">= 1.1.7"

gem "merb-core",                merb_gems_version
gem "merb-action-args",         merb_gems_version
gem "merb-assets",              merb_gems_version
gem "merb-helpers",             merb_gems_version
gem "merb-mailer",              merb_gems_version
gem "merb-slices",              merb_gems_version
gem "merb-param-protection",    merb_gems_version
gem "merb-exceptions",          merb_gems_version
gem "merb-gen",                 merb_gems_version

gem("merb-cache", merb_gems_version) do
  Merb::Cache.setup do
    register(Merb::Cache::FileStore) unless Merb.cache
  end
end

gem "maruku"
gem "merb_babel"

# Change to server of your choice
gem "thin"

group :development do
  gem 'rspec', '~> 1.3'
  gem 'ruby-debug'
end
