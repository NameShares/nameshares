require 'net/http'
require 'uri'
require 'json'

module NameShares
  class API

    @@rpc_instance = nil

    def self.init(port, username, password, options = nil)
      options ||= { ignore_errors: false }
      @@rpc_instance = NameShares::API::Rpc.new(port, username, password, options)
    end

    def self.rpc
      @@rpc_instance
    end

    class Wallet
      def self.method_missing(name, *params)
        NameShares::API::rpc.request("wallet_" + name.to_s, params)
      end
    end

    class Network
      def self.method_missing(name, *params)
        NameShares::API::rpc.request("network_" + name.to_s, params)
      end
    end

    class Blockchain
      def self.method_missing(name, *params)
        NameShares::API::rpc.request("blockchain_" + name.to_s, params)
      end
    end

    class Misc
      def self.method_missing(name, *params)
        NameShares::API::rpc.request(name.to_s, params)
      end
    end

    class Rpc

      class Error < RuntimeError; end

      def initialize(port, username, password, options)
        @uri = URI("http://localhost:#{port}/rpc")
        @req = Net::HTTP::Post.new(@uri)
        @req.content_type = 'application/json'
        @req.basic_auth username, password
        @options = options
        @logger = options[:logger]
      end

      def log(s)
        if @logger then @logger.info s else puts s end
      end

      def request(method, params = nil)
        params = params || []
        log "request: #{method} #{params.join(' ')}"
        result = nil
        Net::HTTP.start(@uri.hostname, @uri.port) do |http|
          @req.body = { method: method, params: params, id: 0 }.to_json
          response = http.request(@req)
          result = JSON.parse(response.body)
          if result['error']
            if !@options[:ignore_errors]
              raise Error, result['error'], "#{method} #{params ? params.join(' ') : ''}"
            else
              log "Error: #{result['error']}"
              STDERR.puts "Error: #{result['error']}\n"
            end
          else
            log 'ok'
          end
        end
        return result['result']
      end

    end

  end

end

 
if $0 == __FILE__
  puts "NameShares API test.."
  NameShares::API.init(5680, 'user', 'pass')
  accounts = NameShares::API::Wallet.list_my_accounts()
  first_account = accounts[0]['name']
  puts NameShares::API::Wallet.account_transaction_history(first_account)
  puts NameShares::API::Wallet.market_order_list("USD", "BTSX")
  puts NameShares::API::Blockchain.list_assets("USD", 1)
end
