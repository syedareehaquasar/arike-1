class District < ApplicationRecord
  belongs_to :state
  has_many :lsg_bodies
end
