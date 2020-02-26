# json-server
Docker container for https://github.com/typicode/json-server - a fake REST API for devs

You can define a list of COLLECTIONS that will be accepted in REST calls at http://localhost:3000/[COLLECTION] in ENV parameters (see below).

See more info at https://github.com/typicode/json-server

## Usage

* Create docker-compose.yml

```yml
version: '3.7'
services:
  json-server:
    image: flaviostutz/json-server
    ports:
      - "3000:3000"
    environment:
      - COLLECTIONS=cars,houses
```

* Run ```docker-compose up```

* Post data to collection
```curl -X POST http://localhost:3000/cars -d '{"name":"great car", "type":"1", "year":"2001"}'```

* List data from collection
```curl http://localhost:3000/cars```

## Tips

* To use your own json data, extend this container (FROM flaviostutz/json-server) and place your own db.json file at /db.json (see [/example](/example)

* Good tutorial on json-server usage at https://medium.com/codingthesmartway-com-blog/create-a-rest-api-with-json-server-36da8680136d

## ENVs

* COLLECTIONS - comma separated list of accepted collections in REST API. ex: 'cars,person,events' will make curl -X POST http://localhost:3000/cars -d {"name":"Fusca"} acceptable

* RESPONSE_DELAY_MS - time of delay in responses to simulate lag
