const isValid = (s: string): boolean => {
  let orig: number = 0;
  let str: string = s;

  while (str.length !== orig) {
    orig = str.length

    str = str.replace("()", "");
    str = str.replace("[]", "");
    str = str.replace("{}", "");
  }

  return (str.length === 0) ? true : false;
};
