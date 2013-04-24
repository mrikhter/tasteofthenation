Refraction.configure do |req|
  if req.host == "totnnyc2013.com"
    req.permanent! :host => "www.totnnyc2013.com"
  end
end