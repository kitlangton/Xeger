require 'spec_helper'

describe Xeger::Revex do

  describe "#for_word" do
    let(:revex) { Xeger::Revex.new }

    it "reverse engineers lowercase words" do
      reg = revex.for_word "hello"
      expect(reg).to eq /[a-z]+/
    end

    it "reverse engineers uppercase words" do
      reg = revex.for_word "HELLO"
      expect(reg).to eq /[A-Z]+/
    end

    it "reverse engineers captilazed words" do
      reg = revex.for_word "Jonathan"
      expect(reg).to eq /[A-Z][a-z]+/
    end

    it "reverse engineers mixed case words" do
      reg = revex.for_word "WaZzAp"
      expect(reg).to eq /[a-zA-Z]+/
    end

    it "reverse engineers numbers" do
      reg = revex.for_word "15858"
      expect(reg).to eq /\d+/
    end

    it "reverse engineers hyphenated-words" do
      reg = revex.for_word "ha843ppy-40babby"
      expect(reg).to eq /\w+-\w+/
    end
  end

end

