interfaces:
  - interface: ge-0/0/2
    mtu:
    unit:
      - unit_id: 0
        ipv4addr: ['10.10.1.1/24', '20.10.10.10/24']
        ipv6addr: ['2a02::/64']
        description: This is a link

  - interface: ae0
    mtu: 9192
    min_links: "2"
    unit:
      - unit_id: 0
        description: This is a link too
        members: ['ge-0/0/0', 'ge-0/0/1']
        ipv4addr: ['10.1.12.1/24']
  - interface: lo0
    unit:
      - unit_id: 0
        description: Loopback interface
        ipv4addr: ['1.1.1.1/32']