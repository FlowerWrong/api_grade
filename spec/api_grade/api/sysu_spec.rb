# encoding: UTF-8
require 'spec_helper'

describe ApiGrade::Api::Sysu do
  before(:all) do
    @student_id = '11365093'
    @pass = 'aFkApY-133'
  end

  it 'should login to sysu mis' do
    login_hash = ApiGrade::Api::Sysu.login(@student_id, @pass)
    puts login_hash
  end
end
