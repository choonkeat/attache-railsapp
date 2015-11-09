if ENV['IMGIX_HOST'] && ENV['IMGIX_TOKEN']
  Attache::API::V1.class_eval do
    IMGIX_CLIENT = Imgix::Client.new(host: ENV.fetch('IMGIX_HOST'), token: ENV.fetch('IMGIX_TOKEN'), secure: true)

    def attache_url_for(path, geometry)
      IMGIX_CLIENT.path(path).to_url(geometry)
    end
  end
end
