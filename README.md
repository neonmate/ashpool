# HTML Copier

API for dumping websites to AWS.

## `POST` `v1/copy`

Params:

* requires `url` (String)
* requires `access_key_id` (String)
* requires `secret_access_key` (String)

* optional `region` (String), default `us-west-2`


Example request:

```
curl --request POST \
  --url https://html-copier.herokuapp.com/v1/copy \
  --header 'content-type: application/json' \
  --data '{"url": "https://example.com","access_key_id": "1234","secret_access_key": "ABCD"}'
```

Example response:

```
"done"
```
