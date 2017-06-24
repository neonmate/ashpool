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
  --header 'content-type: application/json' \
  --data '{"url": "https://example.com","access_key_id": "1234","secret_access_key": "ABCD","bucket": "test", "region": "us-west-2"}'
```

Example response:

```
{\"status\":200,\"title\":\"Success\"}
```
