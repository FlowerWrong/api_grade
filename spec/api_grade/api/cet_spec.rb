# encoding: UTF-8
require 'spec_helper'
require 'yaml'

describe ApiGrade::Api::Cet do
  before(:all) do
    @user = YAML.load(File.open(ApiGrade.root + '/config/user.yml'))
    @name = @user['cet']['name']
    @number = @user['cet']['number']
  end

  it 'should get cet score from 99sushe' do
    res_hash = ApiGrade::Api::Cet.query(@number, @name)
    expect(res_hash[:status]).to eql('ok')
  end
end
