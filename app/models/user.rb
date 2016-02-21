class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :consultant

  after_create :create_consultant

  private

  def create_consultant
    c = Consultant.new
    c.save(validate: false)
    self.consultant = c
    self.save
  end
end
