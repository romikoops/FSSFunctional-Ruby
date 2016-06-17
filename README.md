# Cigars-search acceptance test

1. install ruby 2.3.0
2. install bundler ```gem install bundler```
3. install required gems ```bundle install ```
4. run tests ```bundle exec rake features```


#rhel commands to run on morty

1. docker exec -it 86d54aab3fd7 bash
2. cd 1ffd0b46334bd0026dd33b2d1ed6d3d60e649f4c/
3. OPTS="driver=phantomjs" bundle exec rake features

#what does it do?
1. See the test cases here - https://github.com/drewbroc/FSSFunctional-Ruby/blob/master/features/search/cigar_search.feature
2. Sends a GET request to the site API (URl with ?JSON=true) and returns response.
3. Compares data to HTML code on the search page once filters are randomly selected; (see link in step 1 for more info) 



