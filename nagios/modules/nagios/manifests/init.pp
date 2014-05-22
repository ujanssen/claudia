class nagios {
	package { 'apache2':
		ensure => installed
	}
	service { 'apache2':
		ensure => running
	}

	package { 'nagios3':
		ensure => installed
	}
	service { 'nagios3':
		ensure => running
	}
	file { '/etc/nagios3/htpasswd.users':
		source => 'puppet:///modules/nagios/htpasswd.users',
		notify => Service['apache2']
	}
}
