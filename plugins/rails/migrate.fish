function migrate
  rake db:migrate db:test:clone
end
