class ContactMailer < ApplicationMailer
  default from: 'lacey.hike@gmail.com'

  def contact_form(name, email, phone, question)
    @name = name
    @email = email
    @phone = phone
    @question = question

    to_emails = "jkent2910@gmail.com, lacey.hike@gmail.com"
    mail(:to => to_emails,
         :subject => "New Contact Form Submitted")

  end
end
