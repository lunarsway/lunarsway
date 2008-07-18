class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Thanks for joining Lunar Sway online community!'  
    @body[:url]  = "Please activate your account! \n\nhttp://localhost:3000/activate/#{user.activation_code}"  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your LunarSway.com account has been activated!'
    @body[:url]  = "Login at http://www.lunarsway.com/login/"
  end
  
  def forgot_password(user)
    setup_email(user)
    @subject    += 'You have requested to change your password'
    @body[:url]  = "http://localhost:3000/reset_password/#{user.password_reset_code}"
  end
 
  def reset_password(user)
    setup_email(user)
    @subject    += 'Your password has been reset.'
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "info@lunarsway.com"
      @subject     = "LunarSway.com - "
      @sent_on     = Time.now
      @body[:user] = user
    end
end