require "spec_helper"

string = "string"

describe string do



  it { should respond_to :language }
  it { should respond_to :lang }



  Yatran::LANGUAGES_TRANSLATIONS.each do |lang|
    pairs = lang.split "-"

    it { should respond_to "from_#{pairs[0]}_to_#{pairs[1]}" }
    it { should respond_to "to_#{pairs[1]}_from_#{pairs[0]}" }
    it { should respond_to "#{pairs[0]}_#{pairs[1]}" }


  end


end