class Candidature < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true
  attribute :file, :attachment => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Weems - Candidature spontanée",
      :to => "maxime@lewys.io",
      :from => %("#{name}" <#{email}>)
    }
  end
end