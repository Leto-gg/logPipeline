PUT _ingest/pipeline/letosearch
{
  "description": "Logs from the Leto.gg Cloudflare worker instances",
  "processors": [
    {
      "grok": {
        "field": "url",
        "patterns": [
          "%{WORD:protocol}://%{WORD:domain}/%{NOTSPACE:path}"
        ]
      }
    },
    {
      "rename": {
        "field": "domain",
        "target_field": "host"
      }
    },
    {
      "remove": {
        "field": "protocol"
      }
    }
  ]
}
