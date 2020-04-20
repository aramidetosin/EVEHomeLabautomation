{% set targets = "r[12345]"%}
{% set not_user = "inetzero"%}
{% set user = "salt"%}

check_new_user_not_exist:
  salt.function:
    - name: general.check_user_not_configured
    - tgt: {{targets}}
    - argsalt.function:
      - user: {{not_user}}

check_new_user_exist:
  salt.function:
    - name: check_user_configured
    - tgt: {{targets}}
    - argsalt.function:
      - user: {{user}}