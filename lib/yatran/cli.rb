#--
# Copyright (c) 2012 Igor Fedoronchuk
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++




module Yatran

  class Error < StandardError
  end

  class CLI
    
    def initialize()
        @options = {}
        languages = Yatran::LANGUAGES_TRANSLATIONS.join(',')
        OptionParser.new do |opts|
          opts.banner = <<EOS
                    Yandex Command line translations.
                    Available language directions : #{languages}
                    Usage: yatran COMMAND [OPTIONS]

EOS
          opts.separator  ""
          opts.separator  "Commands"
          opts.separator  "     d: detect text language"
          opts.separator  "     t: translate text"
          opts.separator  ""
          opts.separator  "Options"
          opts.on( '-p', '--phrase Phrase [OPT]', "Phrase to translate or detect" ) do |source|
            @options[:text] = source
          end
          opts.on( '-s', '--source FILE [OPT]', "File with text to translate" ) do |source|
            @options[:file] = source
          end
          opts.on( '-o', '--output FILE [OPT]', "File with output" ) do |output|
            @options[:output] = output
          end
          opts.on("-f", "--from FROM_LANG [OPT]", "Language of phrase/text ") do |from|
            @options[:from] = from
          end
          opts.on("-t", "--to TO_LANG [OPT]", "Output language ") do |to|
            @options[:to] = to
          end
          opts.on("-l", "--language LANGDIR [OPT]", "Available language direction") do |d|
            @options[:direction] = d
          end
          opts.on( '-d', '--debug', "Debug flag" ) do
            @options[:debug] = true
          end
        end.parse!

      end


      def translate!
        validate_text!
        validate_direction!
        result = @text.send(@direction)
        if @options[:output]
          raise Error.new("File #{@opts[:output]} already exists") if File.exists? @options[:output]
          File.open(@options[:output], 'w') { |f| f.write(result) }
          puts "check file #{@options[:output]}"

        else
          puts "Translated:"
          puts result
        end

      end

      def detect!
        validate_text!
        puts "Detected: #{@text.language}"
      end

      def [](index)
         @options[index]
      end

      private

      def validate_text!
        @text = @options[:text]


        unless @text
          if @options[:file]
            raise Error.new("File #{@options[:file]} doesn't exist") unless File.exists? @options[:file]
            @text = IO.read @options[:file]

          end
        end

        raise Error.new(" Text is undefined ")  if @text.nil?

      end

      def validate_direction!
        @direction = @options[:direction].gsub("-","_")
          unless @direction
             raise Error.new(" Undefined translation direction ")  unless  ( @options[:from] and @options[:to] )
             @direction =  "#{@options[:from]}-#{@options[:to]}"
          end
          @direction = @direction.to_sym
          raise Error.new(" #{@direction} translation is not supported ")  unless @text.respond_to?(@direction)
       end

  end

end