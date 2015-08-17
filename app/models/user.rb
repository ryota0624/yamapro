class User < ActiveRecord::Base

  # for authlogic
  acts_as_authentic do |c|
    c.login_field = :name
  end

end
