# encoding: UTF-8

require 'rest_client'
require 'api_grade/helper'
require 'open-uri'

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
        login_url = 'http://uems.sysu.edu.cn/jwxt/j_unieap_security_check.do'
        login_params = { j_username: student_id, j_password: pass }
        res = RestClient.post login_url, login_params.to_json
        return_hash = { status: 'ok', msg: 'success', cookies: {} }
        if res.code == 200
          return_hash[:status] = 'failed'
          return_hash[:msg] = '用户名不存在或密码错误'
        else
          return_hash[:cookies] = res.cookies
        end
        puts res.to_s
        puts '-' * 20
        puts res.cookies
        puts res.headers
        puts res.code
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
