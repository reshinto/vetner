# VETNER
## Technologies used
* Ruby, Rails, Javascript, HTML, SCSS, Bootstrap, PostgreSQL
### APIS
* One Map: https://docs.onemap.sg/
* Mapbox: https://docs.mapbox.com/
* Leaflet: https://leafletjs.com/reference-1.6.0.html
## Installation instructions
* Clone the repository
```
git clone https://github.com/reshinto/vetner.git
```
* Install all dependencies
```
bundle i
```
* Create Database
```
rails db:create
rails db:migrate
```
* Get API key for Mapbox and One Map
* Create .env file
```
touch .env
```
* Edit .env file and input the required information without quotes
```
GMAIL_USERNAME = example@email.com
GMAIL_PASSWORD = somepassword
ONEMAPTOKEN = someApiKey
MAPBOXTOKEN = someApiKey
```
* (optional) Run seeds to populate sample data
```
rails db:seed
```
## Wireframes
## ERD
<img src="./documentation/vetner-ERD.pdf" alt="ERD image"  width="4200" height="4200">
