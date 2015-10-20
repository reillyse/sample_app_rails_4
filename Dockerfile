FROM rails:onbuild
CMD RAILS_ENV=production bundle exec rake db:migrate && rails s -b 0.0.0.0