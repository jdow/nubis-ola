
# Update Apt first
exec { "apt-get update":
    command => "/usr/bin/apt-get update",
}

import 'okta.pp'
import 'okta_confd.pp'
