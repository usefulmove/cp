/**
 * @param {string} arriveAlice
 * @param {string} leaveAlice
 * @param {string} arriveBob
 * @param {string} leaveBob
 * @return {number}
 */
const countDaysTogether = (arriveAlice, leaveAlice, arriveBob, leaveBob) => {
  const [arrAliceDOY, depAliceDOY, arrBobDOY, depBobDOY] = 
    [arriveAlice, leaveAlice, arriveBob, leaveBob].map(parseDOY);

  let count = 0;
  for (let doy = 1; doy <= 365; doy++) {
    if (present(doy, arrAliceDOY, depAliceDOY) && present(doy, arrBobDOY, depBobDOY)) {
      count++;
    }
  }

  return count;
};

const dayOfYear = (date) => {
  const day = Math.floor((date - new Date(date.getFullYear(), 0, 0)) / (1000 * 60 * 60 * 24));
  return (day % 365) + 1;
}

const parseDOY = (s) => {
  const [month, day] = s.split('-').map(s => parseInt(s));
  return dayOfYear(new Date(2023, month - 1, day - 1));
};

const present = (doy, doy_arr, doy_dep) => (doy <= doy_dep) && (doy >= doy_arr);
