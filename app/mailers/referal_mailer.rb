class ReferalMailer < ActionMailer::Base
  default from: "smtponly10@gmail.com"

    def send_referal_email(user, referal_user)
        @user = user
        @referal_user = referal_user
        mail(to: @referal_user, from: "smtponly10@gmail.com", subject: "Referal Email") do |format|
            format.html {render 'send_referal_email'}
        end
    end
end