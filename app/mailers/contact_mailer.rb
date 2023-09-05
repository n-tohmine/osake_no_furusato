class ContactMailer < ApplicationMailer
  def send_contact_form(contact)
    @contact = contact
    mail(
      from: contact.email,
      to: Rails.application.credentials[:mailer].to_s,
      subject: t('defaults.contact_form')
    )
  end
end
