class User < ApplicationRecord
  has_many :events
  has_many :bio_credentials, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #devise :confirmable, :timeoutable, :trackable

  # Additional attributes
  #attr_accessor :first_name, :middle_initial, :last_name, :birthday, 
  #:address_1, :address_2, :city, :state, :zip_code, :phone, :emergency_contact_name, :emergency_contact_number, 
  #:is_admin, :is_instructor, :is_student, :is_maintenance, :is_frontoffice, :is_guest

  # Default profile settings
   before_create :set_default_profile

  def full_name
    "#{first_name} #{middle_initial.presence || ''} #{last_name}"
  end

  def set_default_profile
     self.is_guest = true
     self.first_name = 'Guest'
     self.last_name = 'User'
  end

  before_save :b4_save
  after_save :aft_save 

  def aft_save
    print "Save was triggered"
  end

  def b4_save 
    print "Before save"
  end
end
