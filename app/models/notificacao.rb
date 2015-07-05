class Notificacao < ActiveRecord::Base
  
  def to_s
    "#{id}"
  end
end
