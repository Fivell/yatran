require "spec_helper"

string = "string"
array = [string, string]
directions =    Yatran::LANGUAGES_TRANSLATIONS


[string, array].each do |obj|
  describe obj do
   directions.each do |lang|
      pairs = lang.split "-"

      it { should respond_to "from_#{pairs[0]}_to_#{pairs[1]}" }
      it { should respond_to "to_#{pairs[1]}_from_#{pairs[0]}" }
      it { should respond_to "#{pairs[0]}_#{pairs[1]}" }

    end
  end

end

describe string do

  it { should respond_to :language }
  it { should respond_to :lang }

end

[Array, String].each do |type|
  describe type do
    it { type.translation_directions.should match_array(directions)    }
  end
end