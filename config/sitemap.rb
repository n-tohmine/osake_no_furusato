require 'aws-sdk-s3'

SitemapGenerator::Sitemap.default_host = 'https://www.osake-no-furusato.jp/'
SitemapGenerator::Sitemap.sitemaps_host = "http://s3-ap-northeast-1.amazonaws.com/#{Rails.application.credentials[:aws][:S3_sitemap_bucket_name]}/sitemaps/sitemap.xml.gz"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(Rails.application.credentials[:aws][:S3_sitemap_bucket_name],
                                                                        aws_access_key_id: Rails.application.credentials[:aws][:access_key_id],
                                                                        aws_secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
                                                                        aws_region: 'ap-northeast-1')

SitemapGenerator::Sitemap.create do
  add search_from_japanmap_path, changefreq: 'yearly'
  add search_from_liquor_type_path, changefreq: 'yearly'
  add breweries_path, priority: 0.8, changefreq: 'monthly', lastmod: Brewery.maximum(:updated_at)
  Brewery.find_each do |brewery|
    add brewery_path(brewery), priority: 0.8, changefreq: 'monthly', lastmod: brewery.updated_at
  end
end
