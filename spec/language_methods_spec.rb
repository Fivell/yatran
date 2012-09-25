require "spec_helper"

string = "string"


describe string do

  it { should respond_to :language }
  it { should respond_to :lang }

end