#!/usr/bin/bash
ipa-server-install \
	{% if setup_dns %}
	--setup-dns  \
	{% endif %}
	{% if use_dns_forwarders %}
    --forwarder {{ dns_forwarder_ip }}  \
	{% else %}
	--no-forwarders  \
	{% endif %}
	--ds-password {{ idm_ds_password }}  \
	--admin-password {{ idm_admin_password }}  \
	--realm	{{ realm|upper }}  \
	--hostname {{ hostname|lower }}.{{ domain|lower }}  \
	--domain  {{ domain|lower }}  \
	--reverse-zone {{ reversename|lower }}  \
	--ip-address {{ ip_address }}
