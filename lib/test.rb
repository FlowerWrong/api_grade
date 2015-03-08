# encoding: UTF-8

require 'rest_client'
require 'open-uri'

def login(student_id, pass)
  login_url = 'http://uems.sysu.edu.cn/jwxt/j_unieap_security_check.do'
  login_params = { j_username: student_id, j_password: pass }
  res = RestClient.post login_url, login_params.to_json
  return_hash = { status: 'ok', msg: 'success', cookies: res.cookies, headers: res.headers }
  if res.code == 200
    return_hash[:status] = 'failed'
    return_hash[:msg] = '用户名不存在或密码错误'
  else
    return_hash[:cookies] = res.cookies
  end
  puts res
  puts '-' * 20
  puts res.cookies
  puts res.headers
  puts res.code
  return_hash
end

student_id = '11365093'
pass = 'aFkApY-133'
=begin
login_hash = login(student_id, pass)
puts login_hash

cookies = login_hash[:cookies]

puts '-' * 20
resource2 = RestClient::Resource.new('http://uems.sysu.edu.cn/jwxt/edp/index.jsp', :headers => login_hash[:headers], :cookies => cookies)
res2 = resource2.get
puts res2.to_s
=end

require 'httparty'

res = HTTParty.post("http://uems.sysu.edu.cn/jwxt/j_unieap_security_check.do",
  { 
    :body => [ { "j_password" => "aFkApY-133", "j_username" => "11365093" } ].to_json
  })

puts res.code