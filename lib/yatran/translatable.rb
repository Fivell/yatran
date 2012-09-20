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

  module Translatable


     def translate(translation_direction)

       API.request('translate', {:lang=> translation_direction, :text=>self})['text'][0]

     end



    # Overrides @method_missing@ to define and call dynamic translation methods.
    #
    # @private
    #
    def method_missing(method, *args, &block)

       translation = translation_direction(method.to_s)

       if translation.nil?
          super(method, *args, &block)
       else
         self.class.send(:define_method, method.to_s) { translate translation}
         translate translation
       end

    end



    # Overrides @respond_to?@ to use the dynamic translation methods.
    #
    # @private

    def respond_to?(method, include_private = false)

      return true unless translation_direction(method.to_s).nil?
      super(method, include_private)
    end



    def translation_direction(method)

      case method
      when /^to_(.*)_from_(.*)$/
         method = "#{$2}-#{$1}"
      when /^from_(.*)_to_(.*)$/
          method = "#{$1}-#{$2}"

      when method.include?("_")
            method["_"] = "-"
      end

      method = nil unless LANGUAGES_TRANSLATIONS.include? method
      method

    end


  end
end