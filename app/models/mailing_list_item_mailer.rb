class MailingListItemMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Thanks for joining the Lunar Sway mailing list!'  
    @body[:blog_url] = "http://lunarsway.blogspot.com"
  end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "Lunar Sway <info@lunarsway.com>"
      @subject     = "LunarSway.com - "
      @sent_on     = Time.now
      @body[:user] = user
      @content_type = "text/html"
    end
end
