def is_paired(input_string):
    sbracs = "".join([ c for c in input_string if c in "{}[]()" ])
    sreduced = sbracs.replace("{}", "").replace("[]", "").replace("()", "")

    if sreduced == "":
        return True

    if sbracs == sreduced:
        return False

    return is_paired(sreduced)
