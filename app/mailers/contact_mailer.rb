class ContactMailer < ActionMailer::Base
default to: "haiderimuzamil@gmail.com"
def contact_email(name, email, message)
@name = name
@email = email
@message = message
mail(from: email, subject: 'Message from Articles website')
end
end
