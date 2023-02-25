PUT _ingest/pipeline/letosearch
{
  "description": "Your pipeline description",
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
