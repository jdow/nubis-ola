# copies over okta confd related stuff

file { '/etc/confd/conf.d/okta.toml':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/okta.toml',
}

file { '/etc/confd/templates/okta.tmpl':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/okta.tmpl',
}

file { '/etc/nubis.d/99-okta-fixup':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    source  => 'puppet:///nubis/files/nubis-fixup',
    require => [ File['/etc/confd/conf.d/okta.toml'], File['/etc/confd/templates/okta.tmpl'] ],
}
