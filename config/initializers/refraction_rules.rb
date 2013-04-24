Refraction.configure do |req|
  if req.host == "totnnyc2013.com"
    req.permanent! :host => "http://www.totnnyc2013.com"
  end
end