[![CI](https://github.com/de-it-krachten/ansible-role-iptables/workflows/CI/badge.svg?event=push)](https://github.com/de-it-krachten/ansible-role-iptables/actions?query=workflow%3ACI)


# ansible-role-iptables

Sets up iptables and applies a default rule set.<br>
For RedHat/CentOS, it will disable firewalld.<br>
On Alpine, it depends on the presence of OpenRC.



## Dependencies

#### Roles
None

#### Collections
- community.general

## Platforms

Supported platforms

- Red Hat Enterprise Linux 7<sup>1</sup>
- Red Hat Enterprise Linux 8<sup>1</sup>
- Red Hat Enterprise Linux 9<sup>1</sup>
- CentOS 7
- RockyLinux 8
- RockyLinux 9
- OracleLinux 8
- OracleLinux 9
- AlmaLinux 8
- AlmaLinux 9
- SUSE Linux Enterprise 15<sup>1</sup>
- openSUSE Leap 15
- Debian 10 (Buster)<sup>1</sup>
- Debian 11 (Bullseye)
- Debian 12 (Bookworm)
- Ubuntu 20.04 LTS
- Ubuntu 22.04 LTS
- Fedora 37
- Fedora 38
- Alpine 3

Note:
<sup>1</sup> : no automated testing is performed on these platforms

## Role Variables
### defaults/main.yml
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


### vars/family-Alpine.yml
<pre><code>
# List of packages to install
iptables_packages:
  - iptables
  - iptables-openrc

# name of the iptables service
iptables_service: iptables

# File to write rules to/from
iptables_state: /etc/iptables/rules-save
</pre></code>

### vars/family-Debian.yml
<pre><code>
# List of packages to install
iptables_packages:
  - iptables
  - iptables-persistent

# name of the iptables service
iptables_service: netfilter-persistent

# File to write rules to/from
iptables_state: /etc/iptables/rules.v4
</pre></code>

### vars/family-RedHat.yml
<pre><code>
# List of packages to install
iptables_packages:
  - iptables
  - iptables-services

# name of the iptables service
iptables_service: iptables

# File to write rules to/from
iptables_state: /etc/sysconfig/iptables
</pre></code>



## Example Playbook
### molecule/default/converge.yml
<pre><code>
- name: sample playbook for role 'iptables'
  hosts: all
  become: "yes"
  tasks:
    - name: Include role 'iptables'
      ansible.builtin.include_role:
        name: iptables
</pre></code>
