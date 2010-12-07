module Fakerama
  class Asset

    # Configure files avaiable here
    FILES = {
      'Advert' => ["banner.jpg", "mpu.jpg", "skyscraper.jpg", "small.jpg"],
      'Audio' => ["mp3.mp3", "ogg.ogg", "wav.wav"],
      'Document' => ["doc.doc", "pages.pages", "pdf.pdf", "txt.txt", "xls.xls"],
      'Flash' => ["fla.fla", "swf.swf"],
      'Photo' => ['portrait.jpg', 'landscape.jpg']
    }

    class << self
    private
      def new_file(filename)
        File.new(File.expand_path(File.join(File.dirname(__FILE__),'..','..','assets',folder_name,filename)))
      end

      def folder_name
        name.split('::').last.downcase
      end
    end


    FILES.each_pair do |klass,files|
      const_set(klass, Class.new(Asset) do
        files.each do |file|
          singleton_class.instance_eval do
            define_method(file.split('.').first) { new_file(file) }
          end
        end
      end)
    end

  end
end
