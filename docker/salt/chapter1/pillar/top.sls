base:
  '*':
    - regional.dns
    - regional.ntp
  vmx_r1:
    - r1.conn_driver
    - r1.router
    - r1.interfaces
  vmx_r2:
    - r2.conn_driver
    - r2.router
    - r2.interfaces
  cisco-r1:
    - r3.conn_driver
    - r3.router
    - r3.interfaces
  cisco-xr-r1:
    - r4.conn_driver
    - r4.router
    - r4.interfaces
  arista-r1:
    - r5.conn_driver
    - r5.router
