xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Sifted by Halalfoodhunt"
    xml.description "Sifted is an online magazine to help halal foodies sift through the multiple food choice available out there, and to bring them more information behind the scenes of the halal food scene."
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.url_slug
        xml.description post.content
        xml.pubDate post.date_published.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end