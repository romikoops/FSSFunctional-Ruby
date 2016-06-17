# famous-smoke-qa

1. install ruby 2.3.0
2. install bundler ```gem install bundler```
3. install required gems ```bundle install ```
4. run tests ```bundle exec rake features```


#rhel commands to run on morty

1. docker exec -it 86d54aab3fd7 bash
2. cd 1ffd0b46334bd0026dd33b2d1ed6d3d60e649f4c/
3. OPTS="driver=phantomjs" bundle exec rake features
