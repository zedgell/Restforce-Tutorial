class Lead < ApplicationRecord
    def client
        Restforce.new(username: '<saleforce_userName>',
            password: '<salesforce_passaword>',
            security_token: '<salesforce_sercurityToken',
            client_id: '<salesforce_consumerKey',
            client_secret: '<salesforce_consumerSecret',
            api_version: "43.0")
    end
end
