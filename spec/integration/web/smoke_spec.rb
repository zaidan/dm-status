require 'spec_helper'

feature 'smoky smoky' do
  scenario 'visiting root' do
    visit('/')
    page.status_code.should be(200)
  end
  
  scenario 'visiting tag' do
    visit('/?tag=foo')
    page.status_code.should be(200)
  end

  scenario 'visiting not found' do
    visit('/not-found')
    page.status_code.should be(404)
  end

  scenario 'visiting css' do
    visit('/assets/application.css')
    page.status_code.should be(200)
  end
end
