[![CI](https://github.com/de-it-krachten/ansible-role-iptables/workflows/CI/badge.svg?event=push)](https://github.com/de-it-krachten/ansible-role-iptables/actions?query=workflow%3ACI)


# ansible-role-iptables

Role to set-up iptables in a persistant manner


Platforms
--------------

Supported platforms

- CentOS 7
- CentOS 8
- Debian 10 (Buster)
- Debian 11 (Bullseye)
- Ubuntu 18.04 LTS
- Ubuntu 20.04 LTS



Role Variables
--------------
<pre><code>


# Set-up iptables from template
iptables_setup: true

# Set-up iptables in persistant manner
iptables_persistent: true

# Flush active rules before applying default set
iptables_flush: false

# Allow server to be ping'ed
iptables_allow_icmp: true

# Allow access using loopback to by-pass iptables
iptables_allow_loopback: true

# Default access
iptables_chains:
  - { name: OUTPUT, policy: ACCEPT }
  - { name: INPUT, policy: DROP }
  - { name: FORWARD, policy: DROP }

# Default ports to be opened
iptables_incoming_rules:
  - { port: 22, protocol: tcp }
</pre></code>


Example Playbook
----------------

<pre><code>


- name: Converge
  hosts: all
  vars:
    iptables_setup: true
  tasks:
    - name: Include role 'ansible-role-iptables'
      include_role:
        name: ansible-role-iptables
</pre></code>
