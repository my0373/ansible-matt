#!/usr/bin/bash
ipa-server-install \
    -U  \
	{% if setup_dns and use_dns_forwarders %}
	--setup-dns  \
    --forwarder {{ dns_forwarder_ip }}  \
    --reverse-zone {{ reversename|lower }}  \
    {% elif setup_dns and not use_dns_forwarders %}
	--no-forwarders  \
	--setup-dns  \
	--reverse-zone {{ reversename|lower }}  \
	{% elif setup_dns %}
	--setup-dns  \
	{% endif %}

	--ds-password {{ idm_ds_password }}  \
	--admin-password {{ idm_admin_password }}  \
	--realm	{{ realm|upper }}  \
	--hostname {{ hostname|lower }}.{{ domain|lower }}  \
	--domain  {{ domain|lower }}  \
	--ip-address {{ ip_address }}
