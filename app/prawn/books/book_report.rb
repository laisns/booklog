class BookReport < Prawn::Document
  # include Prawn::View

  def initialize
    super()
    greeting
    render_file "export.pdf"
    end

  def greeting
    text "hello world 22"
  end
end