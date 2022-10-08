cat <<EOF > y
- ansible.builtin.include_tasks: install.yml
  - ansible.builtin.include_tasks: install.yml
EOF

cat y | sed -r "s/(\s*)- (ansible.builtin.include_tasks:)(.*)/\\1- name: Include\\3\\n\\1  ansible.builtin.include_tasks:\\3/g"

