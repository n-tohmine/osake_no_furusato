module ApplicationHelper
  def page_title(page_title = '', admin: false)
    base_title = if admin
                   'お酒のふるさと（管理画面）'
                 else
                   'お酒のふるさと'
                 end
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def default_meta_tags
    {
      site: 'お酒のふるさと',
      title: 'お酒の工場見学検索アプリ',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: '楽しいお酒の工場見学の旅に出かけましょう。見学ができるお酒の醸造所と近隣の宿泊施設が検索できるサービスです。',
      keywords: 'お酒, 工場見学, 醸造所, 酒造, 酒蔵, ワイナリー, ブルワリー, ディスティラリー, ビール, ワイン, 日本酒, ウイスキー, 試飲',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [{ href: image_url('favicon.ico') }],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@OsakeNoFurusato',
        image: image_url('ogp.png')
      }
    }
  end
end
