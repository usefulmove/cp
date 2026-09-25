/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function(s) {
  let orig = 0;
  let str = s;

  while (str.length !== orig) {
    orig = str.length

    str = str.replace("()", "");
    str = str.replace("[]", "");
    str = str.replace("{}", "");
  }

  return (str.length === 0) ? true : false;
};
