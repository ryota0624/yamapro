class Mylist < ActiveRecord::Base
  belongs_to :user
  belongs_to :essay
  default_scope {order("updated_at desc")}

end
