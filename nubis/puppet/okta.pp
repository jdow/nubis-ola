$okta_version = "05.02.02"

exec {
    'download-okta-agent':
        command => "/usr/bin/wget https://mozilla-admin.okta.com/static/ldap-agent/OktaLDAPAgent-${okta_version}_amd64.deb",
        cwd     => '/root/',
        creates => "/root/OktaLDAPAgent-${okta_version}_amd64.deb",
        before  => Package["OktaLDAPAgent-${okta_version}_amd64"],
}

package {
    'default-jre':
        before  => Package["OktaLDAPAgent-${okta_version}_amd64"],
        ensure => latest;
    "OktaLDAPAgent-${okta_version}_amd64":
        provider => 'dpkg',
        ensure   => installed,
        source   => "/root/OktaLDAPAgent-${okta_version}_amd64.deb";
    'mailutils':
        ensure => latest;
}

host {
    'ldap.db.scl3.mozilla.com':
        ip => '10.22.70.17';
}
