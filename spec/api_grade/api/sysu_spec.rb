# encoding: UTF-8
require 'spec_helper'

describe ApiGrade::Api::Sysu do
  before(:all) do
    @student_id = '11365093'
    @pass = 'aFkApY-133'
  end

  it 'should login to sysu mis' do
    login_hash = ApiGrade::Api::Sysu.login(@student_id, @pass)
    # curl 'http://uems.sysu.edu.cn/jwxt/j_unieap_security_check.do' --data 'j_username=11365093&j_password=aFkApY-133'
    # login_hash = `curl -X HEAD -i 'http://uems.sysu.edu.cn/jwxt/j_unieap_security_check.do' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3' -H 'Connection: keep-alive' -H 'Host: uems.sysu.edu.cn' -H 'Referer: http://uems.sysu.edu.cn/jwxt/' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0' -H 'Content-Type: application/x-www-form-urlencoded' --data 'j_username=11365093&j_password=aFkApY-133'`
    puts '-' * 20
    puts login_hash
  end
end
