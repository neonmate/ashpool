# Ashpool

API for dumping websites to Amazon S3.

## `POST` `v1/dump`

Params:

* requires `url` (String)
* requires `access_key_id` (String)
* requires `secret_access_key` (String)
* requires `bucket`(String)
* requires `region` (String)

Example request:

```
curl --request POST \
  --url https://ashpool-api.herokuapp.com/v1/dump \
  --header 'cache-control: no-cache' \
  --header 'content-type: application/json' \
  --data '{"url": "example.com", "access_key_id": "1234", "secret_access_key": "ABCD", "region": "us-west-2", "bucket": "test"}'
```

Example response:

```
{\"status\":200,\"title\":\"Success\"}
```
