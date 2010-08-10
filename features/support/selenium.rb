def wait_for_ajax(timeout=50000, request_count = 1)
  request_count.times do |index|
    selenium.wait_for_ajax :javascript_framework => :jquery
  end 
end