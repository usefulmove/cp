const judgeCircle = (moves: string[]): boolean => {
  const res: number[] = [...moves].reduce((pos, c) => {
    switch(c) {
      case 'U': return [pos[0], pos[1] + 1];
      case 'D': return [pos[0], pos[1] - 1];
      case 'R': return [pos[0] + 1, pos[1]];
      case 'L': return [pos[0] - 1, pos[1]];
    }
  }, [0, 0]);

  return res.every(a => a === 0);
}
