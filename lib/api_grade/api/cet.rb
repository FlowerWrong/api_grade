# encoding: UTF-8

require 'open-uri'

module ApiGrade
  # Grade api
  #
  # @author FuShengYang
  module Api
    # 四六级成绩查询 api.
    #
    # @author FuShengYang
    module Cet

      # 四六级成绩查询 api
      #
      # @param [Enumerable<String>] cet_num
      # @param [Enumerable<String>] cet_name
      # @return [Hash]
      def query(cet_num, cet_name)
        cet_home = 'http://cet.99sushe.com/'

        cet_name = cet_name.encode('gb2312', 'utf-8')
        cet_name = URI::encode cet_name
        result = `curl "#{cet_home}find" -H "Referer: #{cet_home}" --data "id=#{cet_num}&name=#{cet_name}"`
        result = result.encode('utf-8', 'gb2312')
        cet_result = result.split(',')
        { status: 'ok', msg: 'success', result: cet_result }
      end

      extend self
    end
  end
end
