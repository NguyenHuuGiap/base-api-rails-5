class JsonWebToken
  class << self
    def encode payload, type = nil
      secret = type == :refresh_token ? ENV["JWT_REFRESH_TOKEN_SECRET"] : Rails.application.secrets.secret_key_base
      payload.reverse_merge! meta
      JWT.encode payload, secret
    end

    def decode token, type = nil
      secret = type == :refresh_token ? ENV["JWT_REFRESH_TOKEN_SECRET"] : Rails.application.secrets.secret_key_base
      JWT.decode token, secret
    end

    def valid_payload payload
      !(payload.nil? || expired(payload))
    end

    def valid_payload_reset payload
      !(payload.nil?) || expired_reset(payload)
    end

    def meta
      {
        exp: Settings.expired_date_token.days.from_now.to_i,
        exp_reset: 30.minutes.from_now.to_i
      }
    end

    def expired payload
      Time.zone.at(payload['exp']) < Time.zone.now
    end

    def expired_reset payload
      Time.zone.at(payload['exp_reset']) < Time.zone.now
    end
  end
end
