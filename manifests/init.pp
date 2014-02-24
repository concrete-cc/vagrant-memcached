
package { 'htop':
	ensure => 'latest'
}

package { 'memcached':
	ensure => 'latest'
}


service { 'memcached':
	ensure => running,
	enable => true,
	require => Package['memcached'],
}


file { '/etc/memcached.conf':
	owner	=> 'root',
	group	=> 'root',
	mode  => 644,
	source	=> '/vagrant/memcached.conf',
	notify	=> Service['memcached'],
}
