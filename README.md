[![CI](https://github.com/de-it-krachten/ansible-role-iptables/workflows/CI/badge.svg?event=push)](https://github.com/de-it-krachten/ansible-role-iptables/actions?query=workflow%3ACI)


# ansible-role-iptables

Sets up iptables and applies a default rule set
For RedHat/CentOS, it will disable firewalld.


Platforms
--------------

Supported platforms

- Red Hat Enterprise Linux 7<sup>1</sup>
- Red Hat Enterprise Linux 8<sup>1</sup>
- CentOS 7
- RockyLinux 8
- AlmaLinux 8<sup>1</sup>
- Debian 10 (Buster)
- Debian 11 (Bullseye)
- Ubuntu 18.04 LTS
- Ubuntu 20.04 LTS

Note:
<sup>1</sup> : no automated testing is performed on these platforms

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
  - { port: 22, proto: tcp }
</pre></code>


Example Playbook
----------------

<pre><code>
- name: sample playbook for role 'iptables'
  hosts: all
  vars:
  tasks:
    - name: Include role 'iptables'
      include_role:
        name: iptables
</pre></code>
