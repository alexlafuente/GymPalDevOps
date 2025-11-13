{{/*
get '-' from the string
*/}}
{{- define "get-value" -}} # Get a value from .Values using dot notation
{{- $parts := split "." . -}} # Split the input string by '.'
{{- $obj := $.Values -}} # Start with the root .Values object
{{- range $parts -}} # Iterate over each part
  {{- if contains "-" . -}} # Check if the part contains a '-'
    {{- $obj = index $obj . -}} # Get the object at the current part
  {{- else -}} # If no '-', use pluck to get the value
    {{- $obj = pluck . (dict . $obj) | first -}}
  {{- end -}}
{{- end -}}
{{- $obj -}} # Return the final value
{{- end -}}