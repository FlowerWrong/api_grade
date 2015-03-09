# encoding: UTF-8
require 'spec_helper'
require 'yaml'

describe ApiGrade::Api::Gzhemc do
  before(:all) do
    @user = YAML.load(File.open(ApiGrade.root + '/config/user.yml'))
    @student_id = @user['gzhemc']['name']
    @pass = @user['gzhemc']['pass']
  end

  it 'should login to gzhemc mis' do
    res_hash = ApiGrade::Api::Gzhemc.login(@student_id, @pass)
    puts '-' * 20
    puts res_hash
    expect(res_hash[:status]).to eql('ok')
  end

  it 'should get to the shunt index page of gzhemc mis' do
    login_hash = ApiGrade::Api::Gzhemc.login(@student_id, @pass)
    res_hash = ApiGrade::Api::Gzhemc.get_shunt_index(login_hash['cookies'])
    expect(res_hash[:status]).to eql('ok')
  end

end