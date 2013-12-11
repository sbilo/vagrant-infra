node default {
  class { '::puppet::agent': }
}

node 'puppet.blueshift.nl' inherits default {
  class { '::puppet::master': webserver => 'unicorn' }
}

node 'db1.blueshift.nl' inherits default {
  class { '::cassandra': version => '20x' }
}

node 'db2.blueshift.nl' inherits default {
  class { '::cassandra': version => '20x' }
}

node 'db3.blueshift.nl' inherits default {
  class { '::cassandra': version => '20x' }
}