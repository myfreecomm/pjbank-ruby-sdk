module PJBank
  module Recebimento
    class Base
      attr_reader :http

      def initialize(http)
        @http = http
      end

      def emitir(dados)
        http.post("#{base_url_path}/:credencial/transacoes", { payload: dados })
      end

      def transacoes(params={})
        http.get("#{base_url_path}/:credencial/transacoes", params)
      end

      private

      def base_url_path
        "/recebimentos"
      end
    end
  end
end
