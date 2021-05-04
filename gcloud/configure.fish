#!/usr/bin/env fish

if not command -sq gcloud
    exit 1
end


# The next line updates PATH for the Google Cloud SDK.
bass source '$HOME/Documents/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '$HOME/Documents/google-cloud-sdk/completion.bash.inc'