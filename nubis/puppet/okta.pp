exec {
    'download-okta-agent':
        command => '/usr/bin/wget https://mozilla-admin.okta.com/static/ldap-agent/OktaLDAPAgent-01.02.09_amd64.deb',
        cwd     => '/root/',
        creates => '/root/OktaLDAPAgent-01.02.07_amd64.deb',
        before  => Package['OktaLDAPAgent-01.02.07_amd64'],
}

package {
    'default-jre':
        before  => Package['OktaLDAPAgent-01.02.07_amd64'],
        ensure => latest;
    'OktaLDAPAgent-01.02.07_amd64':
        provider => 'dpkg',
        ensure   => installed,
        source   => '/root/OktaLDAPAgent-01.02.07_amd64.deb';
    'expect':
        ensure => latest;
    'mailutils':
        ensure => latest;
}

host {
    'ldap.db.scl3.mozilla.com':
        ip => '10.22.70.17';
}
