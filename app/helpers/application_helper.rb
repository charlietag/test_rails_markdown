module ApplicationHelper
  def kramdown(text)
    # --------------- kramdown ------------
    kr_options = {
      #auto_ids: false,
      #footnote_nr: 5,
      input: 'GFM',
      #syntax_highlighter_opts: {line_numbers: true},
      #syntax_highlighter_opts: {syntax_highlighter: rouge, disable: true},
      syntax_highlighter_opts: {
        syntax_highlighter: 'rouge',
        table_class: 'rouge-line-table',
        
        # Default: :katex, no need to setup
        #math_engine: :katex,


        # line_numbers conflicts with bootstrap.
        #line_numbers: true,

        span: {
          #line_numbers: false
          start_line: 1
        },

        block: {
          #line_numbers: false,
          start_line: 1
        },

      },
    }
    # --- Rails built-in sanitize ---
    # Some tag is not in allowed list by default, ex: table tr td
    #sanitize Kramdown::Document.new(text, kr_options).to_html

    # XSS is possible, but more convenient
    #raw Kramdown::Document.new(text, kr_options).to_html

    # --- Gem sanitize ---
    # This gem is easier to config ex. RELAXED
    msg = raw Kramdown::Document.new(text, kr_options).to_html
    raw Sanitize.document(msg, Sanitize::Config::RELAXED)

  end
end
