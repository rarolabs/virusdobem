class Dispositivo < ActiveRecord::Base
  validates_presence_of :gcm
  def to_s
    gcm
  end
end
