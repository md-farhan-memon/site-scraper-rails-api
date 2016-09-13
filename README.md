# Site Scraper Rails API

This is a simple, quick Rails 5 API for site Scraping.
## Features
  - ReST API
  - JSON response
  - Versioned
  - Stores H1, H2, H3 and Anchor tags
  - Secured using Token
  - Easily configurable
  - Paginated and Parameterized
  - Easily scalable

You can test the APIs on this URL > https://site-scraper-api.herokuapp.com/

### Installation

- Download/Clone, install the dependencies and run migration.
- Put the following in .bashrc/config vars in remote server:
```sh
export API_TOKEN='SiteScraperAppApiToken'
```
- Start the server.

```sh
$ cd site-scraper-rails-api
$ bundle install
$ rake db:migrate
$ rails s
```

## APIs
Preferably Use Postman to test and verify the APIs
#### Header
Following header needs to be passed for every request:
```sh
Token:SiteScraperAppApiToken
```
If not added, response will be unauthorized - 401
#### Scraping New Link
- Method: POST
- API: /api/v1/links
- Body params: url:https://github.com/
- Possible responses:
- - Success/200 with id of the db row generated if the provided URL is correct and the tags are stored.
- - Unprocessable Entity/422 if there's some exception or error along with error message

#### Show list of links with tags
- Method: GET
- API: /api/v1/links
- Link Params:
- - By default all tags and the link is returned with 5 results per page
- - if specific tags required pass the comma seperated tag names e.g. tags=h1,h3,a
- - For pagination, page=PAGE_NUMBER and per=RESULTS_PER_PAGE
- - E.g. /api/v1/links?tags=h2&page=2&per=3
- Possible responses:
- - Success/200 with array of hashes of link and tags based on parameters passed/default response
- - Unprocessable Entity/422 if there's some exception or error along with error message

#### Show a particular link details
- Method: Get
- API: /api/v1/links/:id
- Link Params:
- - By default all tags and the link is returned
- - if specific tags required pass the comma seperated tag names e.g. tags=h1,h3,a
- - E.g. /api/v1/links/16?tags=h2
- Possible responses:
- - Success/200 with hashes of link and tags based on parameters passed/default response
- - Unprocessable Entity/422 if there's some exception or error along with error message

## Configuration
- Add other tags like H3-H6 if required in the config/initializers/constants.rb (Migrations need to be generated)
- Change token string as per your need in .bashrc or config variables

#### Feel free to fork and comment and discuss the improvements.