node default {
  class { '::puppet::agent': }
}

node 'puppet' inherits default {
  class { '::puppet::master': }
}

node 'db' inherits default {
}

node 'tomee' inherits default {
    tomcat::instance { 'tomee': }
    
    tomcat::webapp::tomee { 'tomee': version => '1.5.0' }
    
    tomcat::realm::userdatabase { 'tomee': }
    
    tomcat::realm::userdatabase::role { 'tomee-admin':
        instance => 'tomee',
    }
    
    tomcat::realm::userdatabase::user { 'tomee':
        instance => 'tomee',
        username => 'tomee',
        password => 'tomee',
        roles    => 'tomee-admin,manager-gui'
    }       
}