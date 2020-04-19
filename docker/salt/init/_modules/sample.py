def first():
    return True


def second():
    return __salt__["test.false"]()


def third():
    return __salt__["sample.first"]()


def users():
    regex_users = r"user\s(?P<user>\S+)\s+\{"
    res = __salt__["napalm.netmiko_commands"](
        "show configuration system login")
    matches = re.finditer(regex_users, test_str, re.MULTILINE)
    for matchNum, match in enumerate(matches, start=1):
        for groupNum in range(0, len(match.groups())):
            groupNum = groupNum + 1
            group = match.group(groupNum)
            return group
