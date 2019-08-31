**API setup**

Clone down project to your local machine.

Install rbenv or rvm to install and manage Ruby versions. This repo uses 2.5.1

To use rbenv and install the correct version in the project directory on your local machine:

Check your ruby version:
`$ ruby -v`

if not the correct version, run:
`$ rbenv install 2.5.1`

then:
`$ rbenv local 2.5.1`

check again and make sure the correct version is set:
`$ ruby -v`
----------
In your terminal, run:

`bundle install` (if you error out here, it’s likely due to an incompatible Ruby version, see above to install RVM or rbenv to manage your Ruby version)

`rake db:create`
`rake db:migrate`
`rake db:seed`

`rspec` to run the test suite on the server

`rails s` to run server
