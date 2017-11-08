class Member < ApplicationRecord
  belongs_to :collaborator, class_name: "User"

  attr_accessor :activation_token
  before_create :create_activation_digest

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string    )
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def accessed?(token)
    digest = send("activation_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activated?
    self.activated
  end

  private
  def create_activation_digest
    self.activation_token = Member.new_token
    self.activation_digest = Member.digest(activation_token)
  end
end
