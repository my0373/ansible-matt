#!/usr/bin/bash
ipa-server-install \
	--no-forwarders  \
	{% if setup_dns %}
	--setup-dns  \
	{% endif %}
	--ds-password {{ idm_ds_password }}  \
	--admin-password {{ idm_admin_password }}  \
	--realm	{{ realm|upper }}  \
	--hostname {{ hostname|lower }}.{{ domain|lower }}  \
	--domain  {{ domain|lower }}  \
	--reverse-zone {{ reversename|lower }}  \
	--ip-address {{ ip_address }}
