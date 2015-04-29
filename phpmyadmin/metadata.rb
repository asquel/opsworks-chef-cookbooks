name              "phpmyadmin"
maintainer        "Sebastian Johnsson"
maintainer_email  "sebastian@agiley.se"
license           "Apache 2.0"
description       "Installs and configures phpmyadmin"
version           "0.1.0"

recipe "phpmyadmin::apache2", "Configures phpmyadmin to be used with apache2"
recipe "phpmyadmin::configuration", "Configures phpmyadmin"

