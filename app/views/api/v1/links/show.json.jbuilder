json.link @link.url
if (tags = @link.h1_tags).loaded?
  json.partial! 'h1_tags', locals: { tags: tags }
end
if (tags = @link.h2_tags).loaded?
  json.partial! 'h2_tags', locals: { tags: tags }
end
if (tags = @link.h3_tags).loaded?
  json.partial! 'h3_tags', locals: { tags: tags }
end
if (tags = @link.a_tags).loaded?
  json.partial! 'a_tags', locals: { tags: tags }
end