require "spec_helper"

string = "string"
array = [string, string]

Yatran::LANGUAGES_TRANSLATIONS.each do |lang|
  pairs = lang.split "-"
  pairs.size.should == 2
  pairs.each do |l|
    l.length.should == 2
  end
  [string, array].each do |obj|
    describe obj do
      it { should respond_to "from_#{pairs[0]}_to_#{pairs[1]}" }
      it { should respond_to "to_#{pairs[1]}_from_#{pairs[0]}" }
      it { should respond_to "#{pairs[0]}_#{pairs[1]}" }
    end
  end
end
