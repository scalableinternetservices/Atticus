module ProfilesHelper
    def cache_key_for_user_row(user)
      "user-#{user.id}-#{user.updated_at}"
    end
    def cache_key_for_users
      "users-#{User.maximum(:updated_at)}"
    end
end
