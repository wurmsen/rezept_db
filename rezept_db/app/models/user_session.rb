class UserSession < Authlogic::Session::Base
  # HACK: Authlogic does not work correctly with rails3
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
end