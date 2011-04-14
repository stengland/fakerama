module Fakerama
  class Content
    class << self
      include ActionView::Helpers::TagHelper

      def headings(range = 1..6)
        range.map do |size|
          [filled_tag("h#{size}"),  paragraph].join
        end.join
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
        end.join
      end

      alias :paragraph :paragraphs

      def filled_tag(tag_name, type = :sentence, count = 3)
        content_tag( tag_name, Faker::Lorem.send(type, count))
      end

      def content
        [paragraphs(3),
          headings(2..5),
          filled_tag(:blockquote),
          paragraph,
          list(:ol, 5),
          paragraph,
          list(:ul, 3),
          paragraphs(4)].shuffle.join
      end
    end
  end
end
