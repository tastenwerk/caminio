class ApiKey
  include Mongoid::Document
  include Mongoid::Timestamps

  field :access_token, type: String
  field :expires_at, type: DateTime
  field :permanent, type: Boolean
  field :name, type: String

  belongs_to :user
  
  before_create :setup_access_token, :setup_expires_at

  private

  def setup_access_token
    self.access_token = SecureRandom.hex(64)
    setup_access_token if self.class.where( access_token: self.access_token ).first
  end

  def setup_expires_at
    self.expires_at = permanent ? 1.year.from_now : 8.hours.from_now
  end

end
