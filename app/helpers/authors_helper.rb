module AuthorsHelper
  def show_nationality(author)
    author.nationality.presence || 'Not Available'
  end

  def show_birth_date(author)
    author.birth_date.presence || 'Not Available'
  end
end
