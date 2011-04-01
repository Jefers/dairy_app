class CGI::Session::ActiveRecordStore::Session
  def self.flush_old_empty_sessions
     self.delete_all "DATE_SUB(NOW(),INTERVAL 6 HOUR) >
     updated_at and BIT_LENGTH(data) <= 688"
  end
end
