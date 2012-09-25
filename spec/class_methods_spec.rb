require "spec_helper"

[Array, String].each do |type|
  describe type do
    it { type.translation_directions.should match_array(Yatran::LANGUAGES_TRANSLATIONS)    }
  end
end