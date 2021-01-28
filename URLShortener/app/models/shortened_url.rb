class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, :user_id, presence: true
    validates :short_url, uniqueness: true
end