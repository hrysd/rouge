describe Rouge::Lexers::Python do
  let(:subject) { Rouge::Lexers::Python.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.py'
      assert_guess :filename => 'foo.pyw'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-python'
      assert_guess :mimetype => 'application/x-python'
    end

    it 'guesses by source' do
      assert_guess :source => '#!/usr/bin/env python'
      assert_guess :source => '#!/usr/local/bin/python3'
      assert_guess :source => '#!/usr/bin/python2'
      assert_guess :source => '#!/usr/bin/python2.7'
      deny_guess   :source => '#!/usr/bin/env python4'
    end
  end

  describe 'lexing' do
    include Support::Lexing

    it 'lexes the demo with no errors' do
      assert_no_errors(lexing_demo)
    end

    it 'lexes the sample without throwing' do
      lex_sample.to_a
    end
  end
end
