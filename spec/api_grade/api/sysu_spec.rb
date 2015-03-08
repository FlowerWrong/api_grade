# encoding: UTF-8
require 'spec_helper'
require 'yaml'

describe ApiGrade::Api::Sysu do
  before(:all) do
    @user = YAML.load(File.open(ApiGrade.root + '/config/user.yml'))
    @student_id = @user['sysu']['name']
    @pass = @user['sysu']['pass']
  end

  it 'should login to sysu mis' do
    res_hash = ApiGrade::Api::Sysu.login(@student_id, @pass)
    expect(res_hash[:status]).to eql('ok')
  end
end
