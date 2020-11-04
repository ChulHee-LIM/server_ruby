module Bootpay
  module Extend
    module Verification
      extend ActiveSupport::Concern

      included do
        def verify(receipt_id)
          raise 'receipt_id 값이 비어있습니다.' if receipt_id.nil?
          raise 'token 값이 비어 있습니다.' if @token.blank?
          request(
            :get,
            get_api_url("receipt/#{receipt_id}"),
            {},
            {
              Authorization: @token
            }
          )
        end

        def confirm(receipt_id)
          raise 'receipt_id를 입력해주세요.' if receipt_id.blank?
          request(
            :post,
            get_api_url('submit'),
            {
              receipt_id: receipt_id
            },
            {
              Authorization: @token
            }
          )
        end

        def certificate(receipt_id)
          request(
            :get,
            get_api_url("certificate/#{receipt_id}"),
            {},
            {
              Authorization: @token
            }
          )
        end

        def subscribe_verify(receipt_id)
          request(
            :get,
            get_api_url("subscribe/billing/#{receipt_id}"),
            {},
            {
              Authorization: @token
            }
          )
        end
      end
    end
  end
end