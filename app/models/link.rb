class Link < ApplicationRecord
  has_many :h1_tags
  has_many :h2_tags
  has_many :h3_tags
  has_many :a_tags

  validates_presence_of :url
  before_create :load_document
  after_create :build_tags

  require 'open-uri'


  def load_document
    @document = Nokogiri::HTML(open(url))
  end

  def build_tags
    TAGS_LIST.each{ |tag| index_tag(tag) }
  end

  def index_tag(tag)
    elements = @document.css(tag)
    case tag
    when "a"
      index_anchor_tags(tag, elements)
    else
      index_header_tags(tag, elements)
    end
  end

  def index_header_tags(tag, elements)
    elements.each do |element|
      if (content = element.text).present?
        self.send("#{tag}_tags").create!(content: content)
      end
    end
  end

  def index_anchor_tags(tag, elements)
    uri = URI(url)
    root = "#{uri.scheme}://#{uri.host}"
    elements.each do |element|
      if (text = element.text).present? && (value = element.values.first).present?
        value = value[0].eql?('/') ? "#{root}#{value}" : value
        self.send("#{tag}_tags").create!(text: text, value: value)
      end
    end
  end
end
