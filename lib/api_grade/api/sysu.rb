# encoding: UTF-8

require 'api_grade/helper'

module ApiGrade
  # Grade api
  #
  # @author FuShengYang
  module Api
    # 中山大学成绩查询 api.
    #
    # @author FuShengYang
    module Sysu

      # 登录中山大学本科教务系统 api
      #
      # @param [Enumerable<String>] student_id
      # @param [Enumerable<String>] pass
      # @return [Hash]
      def login(student_id, pass)
        res = `python "#{ApiGrade.lib}/api_grade/api/sysupy/fakesysujwxt.py" login "#{student_id}" "#{pass}"`
        login_arr = res.split("\n")
        p login_arr
        # return_hash = { status: 'ok', msg: 'success', cookies: {} }
        return_hash = { status: 'ok', msg: 'success', cookies: '' }
        if login_arr[0] == 'True'
          # return_hash[:cookies] = { 'JSESSIONID' => login_arr[1] }
          return_hash[:cookies] = login_arr[1]
        else
          return_hash[:status] = 'failed'
          return_hash[:msg] = '用户名不存在或密码错误'
        end
        return_hash
      end

      # 查询成绩 api
      #
      # @param [Enumerable<String>] student_id
      # @param [Enumerable<String>] pass
      # @return [Hash]
      def query_grade(cookie, sno, year='', term='')

      end

      extend self
    end
  end
end
