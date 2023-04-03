module Developers
  class Custodian
    def self.clean_stale_profiles
      stale_developers = StaleDevelopersQuery.new.stale_developers
      stale_developers.each(&:mark_as_stale_and_notify)
      stale_developers.profile_reminder_notifications
    end
  end
end
