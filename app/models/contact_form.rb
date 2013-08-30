class ContactForm
  include ActiveModel::Validations

  attr_accessor :name, :email, :message, :challenge_response

  validates_presence_of :name, :email, :message, :challenge_response
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i  

  def initialize(params = {})
    @name = params.fetch(:name, "")
    @email = params.fetch(:email, "")
    @message = params.fetch(:message, "")
    @challenge_response = params.fetch(:challenge_response, "")
  end
end
