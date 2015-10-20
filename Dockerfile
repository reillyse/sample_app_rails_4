FROM rails:onbuild
EXPOSE 3000
CMD RAILS_ENV=production bundle exec rake db:migrate && rails s -b 0.0.0.0