module Fakerama
  class Content
    class << self
      include ActionView::Helpers::TagHelper

      def headings(range = 1..6)
        range.map do |size|
          filled_tag("h#{size}") + paragraph
        end.to_s
      end

      def list(*args)
        list_type = (args.first.to_s == 'ol') ? 'ol' : 'ul'
        items = args.last.to_i.times.map do |i|
          content_tag( :li, Faker::Lorem.sentence )
        end
        content_tag(list_type, items, {}, false)
      end

      def paragraphs(count=1)
        count.times.map do
          content_tag( :p, Faker::Lorem.paragraph ) 
        end.to_s
      end

      def paragraph
        paragraphs(1)
      end

      def filled_tag(tag_name, type = :sentence, count = 3)
        content_tag( tag_name, Faker::Lorem.send(type, count))
      end
    end
  end
end
