# README

#uCrypt
A user dashboard that shows the top traded cryotos in the market. You can visualise currency historicity in the form of chartjs line charts. Also included is a crypto news bulletin that keeps you informed of recent updates in the crypto industry. Mobile responsive.   

#Getting started

you will need to get api key for the news api at newsapi.org
Create your own config/application.yml file and type in:

```NEWS_API: [paste your news api key here] ```

Then clone or fork this repository

make sure you are using ruby 2.4.4, if not use rvm and switch over

When ready, run:
bundle install

then setup postgres and conduct migrations:
rails db:migrate
