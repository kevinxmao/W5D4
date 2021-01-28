require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, :user_id, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        # call this on a class
        loop do
            rand_url = SecureRandom.urlsafe_base64(16)
            return rand_url unless ShortenedUrl.exists?(short_url: rand_url)
        end
    end

    def self.convert_url_create(user, long_url)
        ShortenedUrl.create!(
            short_url: ShortenedUrl.random_code,
            long_url: long_url,
            user_id: user.id
        )
    end

end