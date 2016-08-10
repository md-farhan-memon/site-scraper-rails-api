json.results @links.count
json.total_pages @links.total_pages
json.previous_page @links.prev_page
json.next_page @links.next_page
json.links @links do |link|
  json.partial! 'details', locals: { link: link }
end