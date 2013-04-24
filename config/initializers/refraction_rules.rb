Refraction.configure do |req|
  if req.host == "totnnyc2013.com"
    req.rewrite! "http://www.totnnyc2013.com"
  end
end