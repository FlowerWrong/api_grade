# encoding: UTF-8

require 'api_grade/helper'

module ApiGrade
  # Grade api
  #
  # @author FuShengYang
  module Api
    # 广州大学成绩查询 api.
    #
    # @author FuShengYang
    module Gzhemc

      # 登录广州大学本科教务系统 api
      #
      # @param [Enumerable<String>] student_id
      # @param [Enumerable<String>] pass
      # @return [Hash]
      def login(student_id, pass)
        res = `python "#{ApiGrade.lib}/api_grade/api/gzhemc/gzhemc.py" login "#{student_id}" "#{pass}"`
        login_arr = res.split("\n")
        p login_arr
        return_hash = { status: 'ok', msg: 'success', cookies: '' }
        if login_arr[0] == 'True'
          return_hash[:cookies] = login_arr[1]
        else
          return_hash[:status] = 'failed'
          return_hash[:msg] = '用户名不存在或密码错误'
        end
        return_hash
      end

      # 获取选课通道列表 api
      #
      # @param [Hash] cookies
      # @return [Hash]
      def get_shunt_index(cookies)
        url = "https://cas.gzhu.edu.cn/shunt/index.jsp;jsessionid=#{cookies}"
        headers = {
          host: 'cas.gzhu.edu.cn'
        }
        resource = RestClient::Resource.new(url, headers: headers, cookies: {JSESSIONID: cookies})
        res = resource.get
        res = `curl "#{url}" -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3' -H 'Connection: keep-alive' -H "Cookie: JSESSIONID=#{cookies}" -H 'Host: cas.gzhu.edu.cn' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:36.0) Gecko/20100101 Firefox/36.0'`
        puts '-' * 20
        # puts res.code
        puts res
        return_hash = { status: 'ok', msg: 'success', res: res }
      end

      # 查询成绩 api
      #
      # @param [Hash] cookies
      # @return [Hash]
      def query_grade(cookies, sno='', year='', term='')
      end

      extend self
    end
  end
end
