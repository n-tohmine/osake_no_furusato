require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe 'send_mail' do
    it '指定したアドレスからフォームが送信されていること' do
      contact = FactoryBot.build(:contact)
      mail = ContactMailer.send_contact_form(contact).deliver_now
      expect(mail.from.first).to eq (contact.email)
    end

    it '指定した送信先のアドレスであること' do
      contact = FactoryBot.build(:contact)
      mail = ContactMailer.send_contact_form(contact).deliver_now
      expect(mail.to.first).to eq (Rails.application.credentials[:mailer].to_s)
    end

    it '指定したタイトルで送信されていること' do
      contact = FactoryBot.build(:contact)
      mail = ContactMailer.send_contact_form(contact).deliver_now
      expect(mail.subject).to eq ("お問い合わせフォーム")
    end
  end
end
