class API
  
  # returns true if a link is valid (not dead), false if not
  # using URL Expander API from rapidapi.com
  def valid_link?(link)
    response = Unirest.get "https://url-expander1.p.rapidapi.com/url_expander?short_url=#{link}",
    headers:{
      "X-RapidAPI-Host" => "url-expander1.p.rapidapi.com",
      "X-RapidAPI-Key" => "7adf8c6d72msh488376094fc1eb6p10c2d6jsnc34f7743ac55"
    }
    response.body["target_url_alive"] # only want the value from this key in the response body
  end

  # RESPONSE.BODY EXAMPLE
  # "input_url":"https://amzn.to/2S4UzSx"
  # "response_time":669
  # "target_url":"https://www.amazon.com/gift-cards/b?ie=UTF8&node=2238192011"
  # "target_url_alive":true

end
