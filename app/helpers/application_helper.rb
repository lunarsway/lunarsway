# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def nl2br(s)
    s.gsub("\n\r","<br>").gsub("\r", "").gsub("\n", "<br />")
  end

  def truncate(string, length=150, tail='...')
    if string.length > length
      string[0..length-1] + tail
    else
      string
    end
  end
end
