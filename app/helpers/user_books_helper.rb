module UserBooksHelper
  def book_status_for_select
    options = { 'To Read': UserBook::TO_READ, 'Read': UserBook::READ,
               'Currently Reading': UserBook::READING }
    options_for_select(options)
  end
end
