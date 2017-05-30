class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to root_url
  end
  
  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Sifted by Halalfoodhunt.com"
    title       = [controller_name, action_name].join(" ")
    description = "SIFTED is an online magazine that aims to highlight the variety of halal food choices in the world for foodies, while observing the growth of the halal industry in the world. The magazine aims to educate readers on the significance of the daily act of Muslims choosing to eat Halal, and acquaint them with the faces and what goes on in the Halal food industry. The magazine focuses on four genres – Interviews, Guides, Halal Food Industry News, and Cooking Tutorials. SIFTED is published by halalfoodhunt.com."
    image       = options[:featured_image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[halalfoodhunt halal food publication],
      twitter: {
        site_name: site_name,
        site: '@halalfoodhunt',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
