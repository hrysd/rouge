describe Rouge::Lexers::Racket do
  let(:subject) { Rouge::Lexers::Racket.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.rkt'
      assert_guess :filename => 'foo.rktd'
      assert_guess :filename => 'foo.rktl'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-racket'
      assert_guess :mimetype => 'application/x-racket'
    end

    it 'guesses by text' do
      assert_guess :source => "#lang racket\n(define x 2)"
      assert_guess :source => '#lang scribble'
      assert_guess :source => '#lang typed/racket'
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
