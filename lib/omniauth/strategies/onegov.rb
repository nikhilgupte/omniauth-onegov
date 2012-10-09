require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class OneGov < OmniAuth::Strategies::OAuth2
      SITE = ENV['SITE'] || 'http://onegov.dev'
      API_PATH_PREFIX = '/api/v1'
      option :client_options, { :site => SITE }
      
      uid { raw_info['uid'] }

      info do
        {
          :name => [raw_info['first_name'], raw_info['last_name']].delete_if(&:blank?).join(" "),
          :email => raw_info['email'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :location => {
            :street => raw_info['address']['street'],
            :city => raw_info['address']['city'],
            :state => raw_info['address']['state'],
            :zip => raw_info['address']['zip']
          }
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = 'oauth_token'
        @raw_info ||= access_token.get("#{API_PATH_PREFIX}/me").parsed
      end

    end
  end
end
OmniAuth.config.add_camelization 'onegov', 'OneGov'
